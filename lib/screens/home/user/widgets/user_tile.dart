import 'package:flutter/material.dart';

import '../../../../utils/theme.dart';

class UserTile extends StatelessWidget {
  const UserTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16.0),
      decoration: const BoxDecoration(
        color: KsSmartTheme.primaryColor,
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      child: Row(
        children: [
          /// [ display user profile image ]
          const CircleAvatar(),
          SizedBox(width: MediaQuery.of(context).size.width * 0.05),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// [ display user name ]
              Text('Username',
                  overflow: TextOverflow.visible,
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(color: KsSmartTheme.black)),

              /// [ display user email ]
              Text('Email',
                  overflow: TextOverflow.visible,
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .subtitle2!
                      .merge(const TextStyle(
                        color: KsSmartTheme.black,
                        fontWeight: FontWeight.w400,
                      ))),

              /// [ display user date of birth ]
              Text('23-10-2020',
                  overflow: TextOverflow.visible,
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .subtitle2!
                      .merge(const TextStyle(
                        color: KsSmartTheme.black,
                        fontWeight: FontWeight.w400,
                      ))),
            ],
          ),
          const Spacer(),

          /// [ View profile ] button
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.2,
            height: MediaQuery.of(context).size.height * 0.085,
            child: TextButton(
                onPressed: () {},
                child: const Text(
                  'View',
                  style: TextStyle(color: KsSmartTheme.black),
                )),
          ),
        ],
      ),
    );
  }
}
