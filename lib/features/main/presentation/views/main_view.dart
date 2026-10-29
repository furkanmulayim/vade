import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../app/router/app_router.dart';
import '../widgets/main_bottom_navigation.dart';

@RoutePage()
class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) => AutoTabsScaffold(
    homeIndex: 0,
    routes: const [
      HomeRoute(),
      CategoriesRoute(),
      DocumentsRoute(),
      SettingsRoute(),
    ],
    bottomNavigationBuilder: (context, tabsRouter) => MainBottomNavigation(
      selectedIndex: tabsRouter.activeIndex,
      onSelected: tabsRouter.setActiveIndex,
      onCreate: () => context.router.push(const CreateRoute()),
    ),
  );
}
