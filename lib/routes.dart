import 'package:flutter/material.dart';

import 'package:ks_smart/screens/auth/pages/signuppage.dart';

import '../screens/screens.dart';
import 'screens/home/user/new_user.dart';

class MyRoutes {
  static Route<dynamic> myRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/auth':
        return MaterialPageRoute(
          builder: (context) => const AuthPage(),
        );

      case '/signup':
        return MaterialPageRoute(
          builder: (context) => const SignupPage(),
        );
      case '/login':
        return MaterialPageRoute(
          builder: (context) => const LoginPage(),
        );

      case '/home':
        return MaterialPageRoute(
          builder: (context) => const Home(),
        );

      case '/new-user':
        return MaterialPageRoute(
          builder: (context) => const NewUser(),
        );
    }
    return MaterialPageRoute(
      builder: (context) => const AuthPage(),
    );
  }
}
