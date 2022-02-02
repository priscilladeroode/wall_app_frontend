import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../../base_components/wall_elevated_button.dart';
import '../../wall_app_bar_controller.dart';

import '../wall_app_bar_logo.dart';

class WallMainAppBarArea extends StatelessWidget {
  final WallAppBarController controller;
  const WallMainAppBarArea({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: controller.authStore.accessToken == null
              ? () => Modular.to.navigate('/home')
              : () => Modular.to.navigate('/home/myHome'),
          child: const WallAppBarLogo(maxHeight: 36),
        ),
        Observer(builder: (context) {
          return Row(
            children: controller.authStore.accessToken == null
                ? ([
                    TextButton(
                        onPressed: () => Modular.to.pushNamed('/auth/signin'),
                        child: const Text('Sign In')),
                    const SizedBox(width: 16),
                    WallElevatedButton(
                        onPressed: () => Modular.to.pushNamed('/auth/signup'), label: 'Sign Up')
                  ])
                : ([
                    TextButton(
                        onPressed: () => controller.signOut(), child: const Text('Sign out')),
                  ]),
          );
        }),
      ],
    );
  }
}
