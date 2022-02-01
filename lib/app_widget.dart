import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'app_controller.dart';

import 'wall_ui/themes/wall_themes.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends ModularState<AppWidget, AppController> {
  @override
  void initState() {
    controller.verifyIsLogged();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wall App',
      theme: WallThemes.light,
      darkTheme: WallThemes.dark,
      themeMode: ThemeMode.light,
    ).modular();
  }
}
