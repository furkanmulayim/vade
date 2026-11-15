import 'package:material_ui/material_ui.dart';
import 'package:flutter/services.dart';
// Required to theme Flutter SDK widgets used by blurred_overlay.
// ignore: deprecated_member_use
import 'package:flutter/material.dart' as flutter;
import 'package:provider/provider.dart';

import '../core/di/injection.dart';
import '../core/providers/app_provider.dart';
import '../shared/theme/app_theme.dart';
import 'router/app_router.dart';

class AutocarApp extends StatefulWidget {
  const AutocarApp({super.key});

  @override
  State<AutocarApp> createState() => _AutocarAppState();
}

class _AutocarAppState extends State<AutocarApp> {
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider.value(
    value: getIt<AppProvider>(),
    child: Builder(
      builder: (context) => MaterialApp.router(
        title: "Autocar",
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light,
        darkTheme: AppTheme.dark,
        themeMode: context.select<AppProvider, ThemeMode>(
          (provider) => provider.themeMode,
        ),
        routerConfig: _appRouter.config(),
        builder: (context, child) {
          final overlayStyle = Theme.of(context).brightness == Brightness.dark
              ? SystemUiOverlayStyle.light
              : SystemUiOverlayStyle.dark;
          return AnnotatedRegion<SystemUiOverlayStyle>(
            value: overlayStyle,
            child:
                // Required while blurred_overlay uses Flutter SDK Material widgets.
                // ignore: deprecated_member_use
                MaterialUiCompatibilityBridge(
                  child: Builder(
                    builder: (context) => flutter.Theme(
                      data: flutter.Theme.of(context).copyWith(
                        appBarTheme: flutter.Theme.of(context).appBarTheme
                            .copyWith(systemOverlayStyle: overlayStyle),
                      ),
                      child: child!,
                    ),
                  ),
                ),
          );
        },
      ),
    ),
  );
}
