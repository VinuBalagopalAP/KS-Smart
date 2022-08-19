import 'package:flutter/material.dart';

import '../../../../utils/theme.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final IconData icon;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final bool obscureText;
  final Widget? suffixIcon;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.icon,
    this.keyboardType,
    this.validator,
    this.obscureText = false,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      padding: const EdgeInsets.all(4.0),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        color: KsSmartTheme.whitishGrey,
      ),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        autofocus: false,
        keyboardType: keyboardType,

        /// [ decoration ] is used to style the [ TextFormField ].
        decoration: InputDecoration(
          icon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                icon,
                color: KsSmartTheme.black,
              )),
          suffixIcon: suffixIcon,
          border: InputBorder.none,
          hintText: hintText,
          labelStyle: Theme.of(context).textTheme.subtitle1!,
        ),

        /// [ textInputAction ] is used to move to the [ next field  ] when the user presses the [ next ] key.
        textInputAction: TextInputAction.next,

        /// [ value ] is the value of the [ email ] field.
        validator: validator,

        /// [ onSaved ] is used to save the [ email field value. ]
        onSaved: (value) {
          controller.text = value!.toString();
        },
      ),
    );
  }
}
