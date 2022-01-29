import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../commons/breakpoints.dart';
import '../../../wall_ui.dart/base_components/wall_page_title.dart';
import '../../../wall_ui.dart/components/wall_app_bar.dart';
import '../../../wall_ui.dart/components/wall_post_card.dart';
import 'home_page_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomePageController> {
  @override
  void initState() {
    controller.getAll();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final device = Breakpoint.fromMediaQuery(context).device;
    return Scaffold(
      appBar: WallAppBar(
        widthScreen: MediaQuery.of(context).size.width,
        device: device,
        mainActions: [
          TextButton(onPressed: () {}, child: const Text('Sign In')),
          const SizedBox(width: 16),
          ElevatedButton(onPressed: () {}, child: Text('Sign Up'.toUpperCase()))
        ],
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            WallPageTitle(
              title: 'Check our new posts!',
              device: device,
            ),
            Observer(
              builder: (context) {
                return controller.store.loading == true
                    ? const Center(
                        child: SizedBox(
                          height: 50,
                          width: 50,
                          child: CircularProgressIndicator(),
                        ),
                      )
                    : Expanded(
                        child: GridView.builder(
                          padding: device == LayoutClass.desktop
                              ? EdgeInsets.only(
                                  bottom: 40,
                                  left: MediaQuery.of(context).size.width * 0.15,
                                  right: MediaQuery.of(context).size.width * 0.15,
                                )
                              : const EdgeInsets.only(bottom: 40, left: 16, right: 16),
                          shrinkWrap: true,
                          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                            mainAxisExtent: 400,
                            maxCrossAxisExtent: 400,
                            childAspectRatio: 1,
                            mainAxisSpacing: 24,
                            crossAxisSpacing: 24,
                          ),
                          itemCount: controller.store.posts.length,
                          itemBuilder: (context, index) {
                            return WallPostCard(
                              device: device,
                              isNew: index < 2,
                              post: controller.store.posts[index],
                            );
                          },
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
