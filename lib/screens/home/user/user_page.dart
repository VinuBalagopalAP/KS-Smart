import 'package:flutter/material.dart';
import 'package:ks_smart/screens/home/user/widgets/head.dart';

import '../../../utils/theme.dart';
import './widgets/user_tile.dart';

class UserPage extends StatelessWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// [ display admin name ]
            Head(
              buttonName: 'New user',
              icon: Icons.person_add,
              onTap: () {
                debugPrint('New user');
                Navigator.pushNamed(context, '/new-user');
              },
            ),

            Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text('Recent Users',
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(color: KsSmartTheme.primaryColor))),

            /// [ List of recent users ] will be displayed here.
            SingleChildScrollView(
              child: SizedBox(
                height: MediaQuery.of(context).size.height / 1.8,
                child: ListView.separated(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return const UserTile();
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
