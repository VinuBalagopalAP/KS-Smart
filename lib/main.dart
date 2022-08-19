import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ks_smart/providers/providers.dart';
import 'package:provider/provider.dart';

import './routes.dart';
import './firebase_options.dart';

void main() async {
  /// [ ensureInitialized ] to ensure that the Firebase app is initialized.
  WidgetsFlutterBinding.ensureInitialized();

  /// [ initializeApp ] to wait for the Firebase app to be initialized.
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: const MaterialApp(
        title: 'Machine test for KS Smart Technologies',
        debugShowCheckedModeBanner: false,
        onGenerateRoute: MyRoutes.myRoutes,
      ),
    );
  }
}
