import 'package:fl_components/router/app_routes.dart';
import 'package:fl_components/screens/screens.dart';
import 'package:fl_components/theme/app_theme.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Componentes en flutter")),
        body: ListView.separated(
            itemBuilder: (context, i) => ListTile(
                title: Text(AppRoutes.menuOptions[i].name),
                leading: Icon(AppRoutes.menuOptions[i].icon,
                    color: AppTheme.primary),
                onTap: () {
                  /*final route = MaterialPageRoute(
                      builder: (context) => const ListView1Screen());
                  Navigator.pushReplacement(context, route);*/
                  Navigator.pushNamed(context, AppRoutes.menuOptions[i].route);
                }),
            separatorBuilder: (_, __) => const Divider(),
            itemCount: AppRoutes.menuOptions.length));
  }
}
