import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import './auth/google_sign_in_provider.dart';
import './navigation/home_navigation_provider.dart';

/// [ providers ] to provide the providers.
List<SingleChildWidget> providers = [
  /// [ GoogleSignInProvider ] to provide the Google sign in provider.
  ChangeNotifierProvider(
    create: (_) => GoogleSignInProvider(),
  ),

  /// [ HomeNavigationProvider ] to provide the home navigation provider.
  ChangeNotifierProvider.value(
    value: HomeNavigation(),
  ),
];
