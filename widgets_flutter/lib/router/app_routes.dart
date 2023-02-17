import 'package:flutter/material.dart';
import 'package:widgets_flutter/screens/screens.dart';
import 'package:widgets_flutter/models/models.dart';

class AppRoutes {
  static const initialRoute = 'home';
  static final menuOptions = <MenuOption>[
    //*CircularProgress Widget
    MenuOption(
        route: 'circularProgress',
        icon: Icons.circle_outlined,
        name: 'C I R C U L A R  P R O G R E S S',
        screen: const CircularProgressScreen(),
    ),

    //* SlideShow Widget
    MenuOption(
        route: 'slideshow',
        icon: Icons.password_outlined,
        name: 'S L I D E  S H O W',
        screen: const SliderShowScreen(),
    ),

    //*UnboxigHorizontal
    MenuOption(
        route: 'unboxinghorizontal',
        icon: Icons.horizontal_distribute_rounded,
        name: 'S L I D E  H O R I Z O N T A L',
        screen: const UnboxingHorizontalScreen(),
    ),

    //*SlideVertical
    MenuOption(
        route: 'slideliquid',
        icon: Icons.waves,
        name: 'S L I D E  V E R T I C A L',
        screen: const SlideLiquidScreen(),
    ),

  ];

  static Map<String, Widget Function(BuildContext)> getAppRoutes() {
    Map<String, Widget Function(BuildContext)> appRoutes = {};
    appRoutes.addAll({'home': (BuildContext context) => const HomeScreen()});
    for (final option in menuOptions) {
      appRoutes.addAll({option.route: (BuildContext context) => option.screen});
    }

    return appRoutes;
  }

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) => const AlertScreen(),
    );
  }
}
