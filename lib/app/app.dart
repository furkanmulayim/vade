import 'package:easy_localization/easy_localization.dart';
import 'package:material_ui/material_ui.dart';
import 'package:provider/provider.dart';

import '../core/di/injection.dart';
import '../core/providers/app_provider.dart';
import '../shared/constants/locale_keys.g.dart';
import '../shared/theme/app_theme.dart';
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
        title: LocaleKeys.name.tr(),
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light,
        darkTheme: AppTheme.dark,
        themeMode: context.select<AppProvider, ThemeMode>(
          (provider) => provider.themeMode,
        ),
        routerConfig: _appRouter.config(),
        builder: (context, child) =>
            // Required while blurred_overlay uses Flutter SDK Material widgets.
            // ignore: deprecated_member_use
            MaterialUiCompatibilityBridge(child: child!),
        localizationsDelegates: [
          ...GlobalMaterialLocalizations.delegates,
          ...context.localizationDelegates,
        ],
        supportedLocales: context.supportedLocales,
        locale: context.locale,
      ),
    ),
  );
}
