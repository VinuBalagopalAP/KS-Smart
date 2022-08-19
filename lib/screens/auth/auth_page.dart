import 'package:flutter/material.dart';
import 'package:ks_smart/utils/theme.dart';

class AuthPage extends StatefulWidget {
  static const routeName = '/auth';

  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              Text(
                'KS Smart Technologies',
                style: Theme.of(context).textTheme.headline5!.merge(TextStyle(
                    color: KsSmartTheme.black,
                    fontSize: MediaQuery.of(context).size.height * 0.05,
                    fontWeight: FontWeight.w900)),
                textAlign: TextAlign.center,
              ),
              const Spacer(),

              /// [ Sign Up ] button.
              AuthButtons(
                title: 'Sign Up',
                titleColor: KsSmartTheme.primaryColor,
                onPressed: () {
                  Navigator.pushNamed(context, '/signup');
                  debugPrint('Get Started');
                },
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),

              /// [ Login ] button.
              AuthButtons(
                title: 'Login',
                onPressed: () {
                  Navigator.pushNamed(context, '/login');
                  debugPrint('Login');
                },
                backgroundColor: KsSmartTheme.primaryColor,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            ],
          ),
        ),
      ),
    );
  }
}

class AuthButtons extends StatelessWidget {
  final String title;
  final Color? titleColor;
  final Function()? onPressed;
  final Color? backgroundColor;

  const AuthButtons({
    super.key,
    required this.title,
    this.onPressed,
    this.backgroundColor,
    this.titleColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height * 0.075,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: backgroundColor ?? KsSmartTheme.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              )),
          onPressed: onPressed,
          child: Text(
            title,
            style:
                Theme.of(context).textTheme.button!.copyWith(color: titleColor),
            textAlign: TextAlign.center,
          )),
    );
  }
}
