import 'package:fl_components/models/menu_option.dart';
import 'package:fl_components/screens/screens.dart';
import 'package:fl_components/screens/slider_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AppRoutes {
  static const initialRoute = '/home';
  static final menuOptions = <MenuOption>[
    // TODO: borrar home
    MenuOption(
        route: '/listview1',
        name: 'Listview tipo 1',
        screen: const ListView1Screen(),
        icon: Icons.place_outlined),
    MenuOption(
        route: '/listview2',
        name: 'Listview tipo 2',
        screen: const ListView2Screen(),
        icon: Icons.add_chart_outlined),
    MenuOption(
        route: '/alert',
        name: 'Alerta - Alert Screen',
        screen: const AlertScreen(),
        icon: Icons.blender_outlined),
    MenuOption(
        route: '/card',
        name: 'Tarjeta - Card Screen',
        screen: const CardScreen(),
        icon: Icons.blender_outlined),
    MenuOption(
        route: '/avatar',
        name: 'Avatar - Avatar Screen',
        screen: const AvatarScreen(),
        icon: Icons.supervised_user_circle_outlined),
    MenuOption(
        route: '/animated',
        name: 'Animated - Animated Screen',
        screen: const AnimatedScreen(),
        icon: Icons.play_circle_outline),
    MenuOption(
        route: '/inputs',
        name: 'Inputs - Inputs Screen',
        screen: const InputsScreen(),
        icon: Icons.input_rounded),
    MenuOption(
        route: '/slider',
        name: 'Slider - Slider Screen',
        screen: const SliderScreen(),
        icon: Icons.slideshow_outlined),
    MenuOption(
        route: '/builder',
        name: 'Infinitescroll & Pull to refresh',
        screen: const ListViewBuilderScreen(),
        icon: Icons.build_circle_rounded)
  ];

  /*static Map<String, Widget Function(BuildContext)> routes = {
    '/home': (BuildContext context) => const HomeScreen(),
    '/listview1': (BuildContext context) => const ListView1Screen(),
    '/listview2': (BuildContext context) => const ListView2Screen(),
    '/alert': (BuildContext context) => const AlertScreen(),
    '/card': (BuildContext context) => const CardScreen()
  };*/

  static Map<String, Widget Function(BuildContext)> getAppRoutes() {
    Map<String, Widget Function(BuildContext)> appRoutes = {};
    appRoutes.addAll({'/home': (BuildContext context) => const HomeScreen()});

    for (final option in menuOptions) {
      appRoutes.addAll({option.route: (BuildContext context) => option.screen});
    }

    return appRoutes;
  }

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(builder: (context) => const AlertScreen());
  }
}
