import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../commons/breakpoints.dart';
import '../../../wall_ui.dart/base_components/wall_page_title.dart';
import '../../../wall_ui.dart/components/wall_app_bar/wall_app_bar.dart';
import '../../../wall_ui.dart/tokens/wall_colors.dart';
import '../home_page/components/cards_grid_widget.dart';

import 'logged_home_page_controller.dart';

class LoggedHomePage extends StatefulWidget {
  const LoggedHomePage({Key? key}) : super(key: key);

  @override
  State<LoggedHomePage> createState() => _LoggedHomePageState();
}

class _LoggedHomePageState extends ModularState<LoggedHomePage, LoggedHomePageController>
    with SingleTickerProviderStateMixin {
  late Breakpoint breakpoint;
  late TabController _tabController;

  @override
  void initState() {
    controller.getAll();
    _tabController = TabController(length: 2, vsync: this);
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
            Observer(
              builder: (context) {
                return WallPageTitle(
                  title: 'Hi, ${controller.authStore.name}!',
                  device: breakpoint.device,
                );
              },
            ),
            Expanded(
              child: Column(
                children: [
                  TabBar(
                    automaticIndicatorColorAdjustment: false,
                    indicatorSize: TabBarIndicatorSize.tab,
                    labelColor: Theme.of(context).primaryColor,
                    labelStyle: Theme.of(context).textTheme.button,
                    unselectedLabelColor: WallColors.neutral400,
                    indicatorColor: Theme.of(context).primaryColor,
                    controller: _tabController,
                    isScrollable: true,
                    tabs: [
                      SizedBox(
                        width: breakpoint.screenWidth * 0.45,
                        child: Tab(
                          child: Text(
                            'All posts'.toUpperCase(),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: breakpoint.screenWidth * 0.45,
                        child: Tab(
                          child: Text('My Posts'.toUpperCase()),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: TabBarView(controller: _tabController, children: [
                      Observer(
                        builder: (context) {
                          return CardsGridWidget(
                            device: breakpoint.device,
                            loading: controller.store.loading,
                            posts: controller.store.allPosts,
                          );
                        },
                      ),
                      Text('oi'),
                    ]),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}