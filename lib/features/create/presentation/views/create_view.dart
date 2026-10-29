import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/locale_keys.g.dart';
import '../../../../core/extensions/context_extension.dart';

@RoutePage()
class CreateView extends StatelessWidget {
  const CreateView({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: Text(context.tr(LocaleKeys.navigation_create))),
    body: SafeArea(
      child: Center(
        child: Text(
          context.tr(LocaleKeys.navigation_create),
          style: context.typo.size24(weight: .w500),
          textAlign: TextAlign.center,
        ),
      ),
    ),
  );
}
