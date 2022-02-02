import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../commons/breakpoints.dart';
import 'wall_theme_mode_switch_controller.dart';

class WallThemeModeSwitch extends StatefulWidget {
  const WallThemeModeSwitch({
    Key? key,
  }) : super(key: key);

  @override
  State<WallThemeModeSwitch> createState() => _WallThemeModeSwitchState();
}

class _WallThemeModeSwitchState
    extends ModularState<WallThemeModeSwitch, WallThemeModeSwitcherController> {
  late Breakpoint breakpoint;
  @override
  void didChangeDependencies() {
    breakpoint = Breakpoint.fromMediaQuery(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: breakpoint.device == LayoutClass.desktop
            ? BoxConstraints(maxWidth: breakpoint.screenWidth * 0.7)
            : null,
        child: Row(
          children: [
            const Spacer(),
            const Icon(Icons.light),
            Observer(builder: (context) {
              return Switch(
                value: controller.store.darkMode,
                onChanged: (_) => controller.store.setThemeMode(),
              );
            }),
          ],
        ),
      ),
    );
  }
}
