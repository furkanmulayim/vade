import 'package:auto_route/auto_route.dart';

import '../../features/home/presentation/views/home_view.dart';
import '../../features/main/presentation/views/main_view.dart';
import '../../features/notifications/notifications_view.dart';
import '../../features/settings/settings_view.dart';
import '../../features/splash/splash_view.dart';
import '../../features/onboarding/onboarding_view.dart';

import '../../features/spend/spend_view.dart';
import '../../features/repair/repair_view.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'View,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: SplashRoute.page, initial: true),
    AutoRoute(page: OnboardingRoute.page),
    AutoRoute(page: NotificationsRoute.page),
    AutoRoute(
      page: MainRoute.page,
      children: [
        AutoRoute(page: HomeRoute.page, initial: true),
        AutoRoute(page: SpendRoute.page),
        AutoRoute(page: RepairRoute.page),
        AutoRoute(page: SettingsRoute.page),
      ],
    ),
  ];
}
