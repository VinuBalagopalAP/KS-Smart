import 'package:flutter/material.dart';

import '../auth_page.dart';
import 'widgets/custom_text_field.dart';
import '../../../utils/theme.dart';

class SignupPage extends StatefulWidget {
  static const routeName = '/signup';

  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

/// [ _PasswordVisible ] is to toggle the password visibility.
bool _passwordVisible = false;

@override
void initState() {
  _passwordVisible;
}

class _SignupPageState extends State<SignupPage> {
  /// [ Form Key ] is used to validate the form.
  final _formKey = GlobalKey<FormState>();

  /// [ emailController ] is used to control the [ email ] field.
  final emailController = TextEditingController();

  /// [ passwordController ] is used to control the [ password ] field.
  final passwordController = TextEditingController();

  /// [ phoneController ] is used to control the [ phone ] field.
  final phoneController = TextEditingController();

  /// [ nameController ] is used to control the [ name ] field.
  final nameController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,

        /// [  AutovalidateMode.onUserInteraction ] is used to validate the form
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: SafeArea(
          child: SingleChildScrollView(
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
                    child: Text('Create your\nAccount',
                        style: Theme.of(context)
                            .textTheme
                            .headline4!
                            .copyWith(color: KsSmartTheme.black))),
                SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Text('Create an account to\nstart using our app',
                        style: Theme.of(context)
                            .textTheme
                            .subtitle2!
                            .copyWith(color: KsSmartTheme.black))),
                SizedBox(height: MediaQuery.of(context).size.height * 0.01),

                /// [ name ] field.
                CustomTextField(
                  controller: nameController,
                  hintText: 'Full Name',
                  icon: Icons.person,
                  keyboardType: TextInputType.name,
                  validator: validateName,
                ),

                /// [ email ] field.
                CustomTextField(
                  controller: emailController,
                  hintText: 'Email',
                  icon: Icons.mail,
                  keyboardType: TextInputType.emailAddress,
                  validator: _validateEmail,
                ),

                /// [ phone ] field.
                CustomTextField(
                  controller: phoneController,
                  hintText: 'Phone number',
                  icon: Icons.phone,
                  keyboardType: TextInputType.phone,
                ),

                /// [ password ] field.
                CustomTextField(
                  controller: passwordController,
                  hintText: 'Confirm Password',
                  icon: Icons.vpn_key,
                  obscureText: !_passwordVisible,
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
                  validator: validatePassword,
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/login');
                    debugPrint('Login');
                  },
                  child: Center(
                    child: Text('Already have an account?',
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1!
                            .copyWith(color: KsSmartTheme.black)),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                Center(
                    child: AuthButtons(
                        title: 'Sign Up',
                        titleColor: KsSmartTheme.primaryColor,
                        onPressed: () {
                          debugPrint('Created an account');
                        },
                        backgroundColor: KsSmartTheme.black)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String? validateName(value) {
    /// [ value!.isEmpty ] is used to check if the [ name ] field is empty.
    if (value!.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter your full name'),
        ),
      );

      if (RegExp(r"\s").hasMatch(value.text)) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Please enter valid username"),
            duration: Duration(milliseconds: 600),
          ),
        );
      }
    }
    return null;
  }

  String? _validateEmail(value) {
    /// [ value!.isEmpty ] is used to check if the [ email ] field is empty.
    if (value!.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter your email'),
        ),
      );
    }
    // String? validatePhoneNumber(value) {
    //   /// [ value!.isEmpty ] is used to check if the [ phone ] field is empty.
    //   if (value!.isEmpty) {
    //     ScaffoldMessenger.of(context).showSnackBar(
    //         const SnackBar(content: Text('Please enter your phone number')));
    //   }
    //   return null;
    // }

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
