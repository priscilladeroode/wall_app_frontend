import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../commons/breakpoints.dart';
import '../../../wall_ui/base_components/wall_page_title.dart';
import '../../../wall_ui/components/wall_app_bar/wall_app_bar.dart';
import '../../../wall_ui/components/wall_theme_mode_switch/wall_theme_mode_switch.dart';
import 'components/cards_grid_widget.dart';
import 'home_page_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomePageController> {
  late Breakpoint breakpoint;

  @override
  void initState() {
    controller.getAll();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    breakpoint = Breakpoint.fromMediaQuery(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WallAppBar(
        breakpoint: breakpoint,
      ),
      body: SizedBox(
        width: breakpoint.screenWidth,
        height: breakpoint.screenHeight,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const WallThemeModeSwitch(),
            WallPageTitle(
              title: 'Check our new posts!',
              device: breakpoint.device,
            ),
            Observer(
              builder: (context) {
                return Expanded(
                  child: CardsGridWidget(
                    device: breakpoint.device,
                    loading: controller.store.loading,
                    posts: controller.store.posts,
                    onPop: () => controller.getAll(),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
