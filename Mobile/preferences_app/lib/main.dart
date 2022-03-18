import 'package:flutter/material.dart';
import 'package:preferences_app/providers/theme_provider.dart';
import 'package:preferences_app/screens/screens.dart';
import 'package:preferences_app/share_preferences/preferences.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Preferences.init();

  runApp(MultiProvider(child: MyApp(), providers: [
    ChangeNotifierProvider(
        create: (_) => ThemeProvider(isDarkMode: Preferences.isDarkMode),
        child: MyApp())
  ]));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (_) => const HomeScreen(),
        SettingsScreen.routeName: (_) => const SettingsScreen()
      },
      theme: Provider.of<ThemeProvider>(context)
          .currentTheme, //Preferences.isDarkMode ? ThemeData.dark() : ThemeData.light(),
    );
  }
}
