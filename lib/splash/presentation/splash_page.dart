import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../wall_ui/base_components/wall_loader.dart';
import 'splash_page_controller.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends ModularState<SplashPage, SplashController> {
  @override
  void initState() {
    controller.isLogged();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: WallLoader.large(),
    );
  }
}
