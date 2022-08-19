import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../../utils/theme.dart';

class Head extends StatelessWidget {
  const Head({
    super.key,
    required this.onTap,
    required this.buttonName,
    required this.icon,
  });

  final Function() onTap;
  final String buttonName;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    /// [ FirebaseAuth.instance.currentUser ] to get the current user.
    final user = FirebaseAuth.instance.currentUser;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Welcome\n${user?.displayName}',
                style: Theme.of(context).textTheme.headline3!.merge(TextStyle(
                      color: KsSmartTheme.primaryColor,
                      fontSize: MediaQuery.of(context).size.height * 0.05,
                      fontWeight: FontWeight.w700,
                    ))),

            /// [ display admin profile image ]
            CircleAvatar(
              radius: MediaQuery.of(context).size.height * 0.05,
              // backgroundImage: NetworkImage(user.photoURL!),
            ),
          ],
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.03),

        /// [ Add new user ] button
        GestureDetector(
          onTap: onTap,
          child: Container(
            width: MediaQuery.of(context).size.width / 2,
            padding: const EdgeInsets.all(16.0),
            decoration: const BoxDecoration(
              color: KsSmartTheme.primaryColor,
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(buttonName,
                    overflow: TextOverflow.visible,
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(color: KsSmartTheme.black)),
                Icon(icon, color: KsSmartTheme.black),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
