import 'package:flutter/material.dart';
import 'package:ks_smart/screens/home/user/widgets/head.dart';

class ProjectPage extends StatelessWidget {
  const ProjectPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
        width: double.infinity,
        child: Column(
          children: [
            Head(
              buttonName: 'New Project',
              icon: Icons.file_copy,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
