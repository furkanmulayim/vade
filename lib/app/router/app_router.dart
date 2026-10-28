import 'package:auto_route/auto_route.dart';

import '../../features/categories/presentation/views/categories_view.dart';
import '../../features/create/presentation/views/create_view.dart';
import '../../features/documents/presentation/views/documents_view.dart';
import '../../features/home/presentation/views/home_view.dart';
import '../../features/main/presentation/views/main_view.dart';
import '../../features/notifications/presentation/views/notifications_view.dart';
import '../../features/search/presentation/views/search_view.dart';
import '../../features/settings/presentation/views/settings_view.dart';
import '../../features/splash/presentation/views/splash_view.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'View,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: SplashRoute.page, initial: true),
    AutoRoute(page: SearchRoute.page),
    AutoRoute(page: NotificationsRoute.page),
    AutoRoute(
      page: MainRoute.page,
      children: [
        AutoRoute(page: HomeRoute.page, initial: true),
        AutoRoute(page: CategoriesRoute.page),
        AutoRoute(page: CreateRoute.page),
        AutoRoute(page: DocumentsRoute.page),
        AutoRoute(page: SettingsRoute.page),
      ],
    ),
  ];
}
