import 'package:auto_route/auto_route.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../app/router/app_router.dart';
import '../widgets/home_app_bar.dart';

@RoutePage()
class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: HomeAppBar(
      nameCode: 'FM',
      onNotifications: () => context.router.push(const NotificationsRoute()),
    ),
  );
}
