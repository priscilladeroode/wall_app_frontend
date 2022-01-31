import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../wall_app_bar_controller.dart';
import 'wall_app_bar_logo.dart';

class WallMobileAppBar extends StatelessWidget {
  final double width;
  final double height;
  final WallAppBarController controller;
  const WallMobileAppBar({
    Key? key,
    required this.width,
    required this.height,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return AppBar(
        toolbarHeight: height,
        title: SizedBox(
          width: width,
          child: const WallAppBarLogo(),
        ),
        actions: controller.authStore.accessToken == null
            ? ([
                IconButton(
                    onPressed: () => Modular.to.pushNamed('/auth/signin'),
                    icon: const Icon(Icons.face))
              ])
            : ([
                IconButton(
                  onPressed: () => controller.signOut(),
                  icon: const Icon(Icons.exit_to_app),
                )
              ]),
      );
    });
  }
}
