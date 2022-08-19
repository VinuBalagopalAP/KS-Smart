import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../utils/theme.dart';
import '../../auth/auth_page.dart';
import '../../auth/pages/widgets/custom_text_field.dart';

class NewUser extends StatefulWidget {
  static const routeName = '/new-user';

  const NewUser({Key? key}) : super(key: key);

  @override
  State<NewUser> createState() => _NewUserState();
}

/// [ _PasswordVisible ] is to toggle the password visibility.
bool _passwordVisible = false;

@override
void initState() {
  _passwordVisible;
}

class _NewUserState extends State<NewUser> {
  /// [ Form Key ] is used to validate the form.
  final _formKey = GlobalKey<FormState>();

  /// [ emailController ] is used to control the [ email ] field.
  final emailController = TextEditingController();

  /// [ passwordController ] is used to control the [ password ] field.
  final passwordController = TextEditingController();

  /// [ passwordController ] is used to control the [ password ] field.
  final dateController = TextEditingController();

  /// [ currentDate, currentMonth, currentYear ] is used to control the [ date ] field.
  final DateTime currentDate = DateTime.now();
  final String currentMonth = DateFormat.yMMM().format(DateTime.now());
  final String currentYear = DateFormat.y().format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.001),
              IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios_new_sharp,
                    color: KsSmartTheme.black,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Text('Create new\nUser',
                      style: Theme.of(context)
                          .textTheme
                          .headline4!
                          .copyWith(color: KsSmartTheme.black))),

              /// [ email ] field.
              CustomTextField(
                controller: emailController,
                hintText: 'Email',
                icon: Icons.email,
                keyboardType: TextInputType.emailAddress,
                validator: validateEmail,
              ),
              CustomTextField(
                controller: passwordController,
                hintText: 'Password',
                icon: Icons.vpn_key,
                obscureText: !_passwordVisible,
                validator: validatePassword,
                suffixIcon: IconButton(
                    onPressed: () {
                      /// Update the state i.e. [ toogle the state of passwordVisible ] variable
                      setState(() {
                        _passwordVisible = !_passwordVisible;
                      });
                    },
                    icon: Icon(
                      /// Based on [ passwordVisible ] state choose the icon
                      _passwordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: KsSmartTheme.black,
                    )),
              ),
              Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  padding: const EdgeInsets.all(4.0),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    color: KsSmartTheme.whitishGrey,
                  ),
                  child: TextFormField(
                      controller: dateController,
                      autofocus: false,

                      /// [ decoration ] is used to style the [ TextFormField ].
                      decoration: InputDecoration(
                        icon: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.calendar_month,
                              color: KsSmartTheme.black,
                            )),

                        /// [ calendar ] is used to show the [ date ] picker.
                        suffixIcon: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.arrow_downward,
                            color: KsSmartTheme.black,
                          ),
                        ),
                        border: InputBorder.none,
                        hintText: 'Date of Birth',
                        labelStyle: Theme.of(context).textTheme.subtitle1!,
                      ))),
              const Spacer(),

              /// [ createAccount ] button.
              Center(
                  child: AuthButtons(
                      title: 'Create',
                      titleColor: KsSmartTheme.primaryColor,
                      onPressed: () {
                        debugPrint('User created');
                        Navigator.pushNamed(context, '/home');
                      },
                      backgroundColor: KsSmartTheme.black)),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            ],
          ),
        ),
      ),
    );
  }

  String? validateEmail(value) {
    /// [ value!.isEmpty ] is used to check if the [ email ] field is empty.
    if (value!.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter your email'),
        ),
      );
    }

    /// [ emailPattern & regex ] is used to validate the [ email ].
    Pattern emailPattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$";

    RegExp emailRegex = RegExp(emailPattern.toString());

    /// [ !regex.hasMatch(value) ] is used to validate the [ email ] field.
    if (!emailRegex.hasMatch(value.toString())) {
      ScaffoldMessenger.of(context).showSnackBar(
        /// [ snackBar ] is used to show the error message.
        const SnackBar(
          content: Text('Please enter a valid email'),
        ),
      );
    }
    return null;
  }

  String? validatePassword(value) {
    /// [ value!.isEmpty ] is used to validate the [ password ] field.
    if (value!.isEmpty) {
      /// [ snackBar ] is used to show the error message.
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please enter your password')));

      /// [ passwordPattern & passwordRegex ] is used to validate the [ password ].
      String passwordPattern =
          r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';

      RegExp passwordRegex = RegExp(passwordPattern.toString());

      /// [ !passwordRegex.hasMatch(value) ] is used to validate the [ password ] field.
      if (!passwordRegex.hasMatch(value.toString())) {
        /// [ snackBar ] is used to show the error message.
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text(
          'Password should contain atleast one uppercase, one lowercase, one number and one special character',
        )));
      }

      /// [ value.lenth < 6 ] is used to check the length of the [ password ] field.
      value.length < 6 || value.length > 10
          ? ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: value.length > 10
                  ? const Text(
                      'Password too long, should maximum contains 10 characters.')
                  : const Text(
                      'Password too short, should minimum contains 6 characters.'),
            ))
          : '';
      return null;
    }
    return null;
  }
}
