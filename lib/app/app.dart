import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../core/di/injection.dart';
import '../core/providers/app_provider.dart';
import '../core/theme/app_theme.dart';
import 'router/app_router.dart';

class VadeApp extends StatefulWidget {
  const VadeApp({super.key});

  @override
  State<VadeApp> createState() => _VadeAppState();
}

class _VadeAppState extends State<VadeApp> {
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider.value(
    value: getIt<AppProvider>(),
    child: Builder(
      builder: (context) => MaterialApp.router(
        title: 'Vade',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light,
        darkTheme: AppTheme.dark,
        themeMode: context.select<AppProvider, ThemeMode>(
          (provider) => provider.themeMode,
        ),
        routerConfig: _appRouter.config(),
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
      ),
    ),
  );
}
