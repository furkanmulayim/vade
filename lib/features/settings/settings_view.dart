import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:material_ui/material_ui.dart';

import '../../shared/constants/locale_keys.g.dart';
import '../../shared/extensions/context_extension.dart';

@RoutePage()
class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    body: SafeArea(
      child: Center(
        child: Text(
          LocaleKeys.navigation_settings.tr(),
          style: context.typo.size24(weight: .w500),
          textAlign: TextAlign.center,
        ),
      ),
    ),
  );
}
