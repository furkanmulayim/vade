import 'package:auto_route/auto_route.dart';
import 'package:material_ui/material_ui.dart';
import 'package:vade/features/create/create_view.dart';

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
      onCreate: () => showCreateSheet(context),
    ),
  );

  Future<void> showCreateSheet(BuildContext context) =>
      showModalBottomSheet<void>(
        context: context,
        useRootNavigator: true,
        isScrollControlled: true,
        useSafeArea: true,
        builder: (_) => const CreateView(),
      );
}
