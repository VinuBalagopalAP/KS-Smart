import 'package:flutter/material.dart';

import '../../../utils/theme.dart';
import '../../auth/auth_page.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text('Settings',
                  style: Theme.of(context).textTheme.headline3!.merge(TextStyle(
                        color: KsSmartTheme.primaryColor,
                        fontSize: MediaQuery.of(context).size.height * 0.05,
                        fontWeight: FontWeight.w700,
                      ))),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),

              /// [ Logout ] button.
              AuthButtons(
                title: 'Logout',
                onPressed: () {
                  Navigator.pushNamed(context, '/auth');
                  // FirebaseAuth.instance.signOut();
                  debugPrint('Logout');
                },
                backgroundColor: KsSmartTheme.primaryColor,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            ],
          )),
    );
  }
}
