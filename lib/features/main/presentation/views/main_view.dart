import 'package:auto_route/auto_route.dart';
import 'package:material_ui/material_ui.dart';

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
      SpendRoute(),
      RepairRoute(),
      SettingsRoute(),
    ],
    bottomNavigationBuilder: (context, tabsRouter) => MainBottomNavigation(
      selectedIndex: tabsRouter.activeIndex,
      onSelected: tabsRouter.setActiveIndex,
    ),
  );
}
