import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'wall_ui.dart/themes/wall_themes.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

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
