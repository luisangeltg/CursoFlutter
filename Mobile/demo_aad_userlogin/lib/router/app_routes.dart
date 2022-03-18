import 'package:demo_aad_userlogin/screens/azure_auth_screen.dart';
import 'package:flutter/material.dart';

import '../models/menu_option.dart';
import "package:demo_aad_userlogin/screens/screens.dart";

class AppRoutes {
  static const initialRoute = "home";
  static final menuOptions = <MenuOption>[
    MenuOption(
        route: "azure/auth",
        name: "azure/auth",
        screen: const AzureAuthScreen())
  ];

  static Map<String, Widget Function(BuildContext)> getAppRoutes() {
    Map<String, Widget Function(BuildContext)> appRoutes = {};
    appRoutes.addAll({"home": (BuildContext context) => const HomeScreen()});

    for (final option in menuOptions) {
      appRoutes.addAll({option.route: (BuildContext context) => option.screen});
    }

    return appRoutes;
  }

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(builder: (context) => const AlertScreen());
  }
}
