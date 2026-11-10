import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../core/models/vade.dart';
import '../../features/categories/presentation/views/categories_view.dart';
import '../../features/detail/detail_view.dart';
import '../../features/documents/documents_view.dart';
import '../../features/home/presentation/views/home_view.dart';
import '../../features/main/presentation/views/main_view.dart';
import '../../features/notifications/notifications_view.dart';
import '../../features/search/search_view.dart';
import '../../features/settings/settings_view.dart';
import '../../features/splash/splash_view.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'View,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: SplashRoute.page, initial: true),
    AutoRoute(page: SearchRoute.page),
    AutoRoute(page: DetailRoute.page),
    AutoRoute(page: NotificationsRoute.page),
    AutoRoute(
      page: MainRoute.page,
      children: [
        AutoRoute(page: HomeRoute.page, initial: true),
        AutoRoute(page: CategoriesRoute.page),
        AutoRoute(page: DocumentsRoute.page),
        AutoRoute(page: SettingsRoute.page),
      ],
    ),
  ];
}
