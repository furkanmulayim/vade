import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:vade/core/constants/asset_path.dart';
import 'package:vade/core/widgets/custom_icon_widget.dart';

import '../../../../core/constants/locale_keys.g.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../../core/models/vade.dart';
import '../../../../core/widgets/custom_button_widget.dart';

@RoutePage()
class DetailView extends StatelessWidget {
  const DetailView({required this.vade, super.key});

  final Vade vade;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.detail_title.tr()),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.edit, size: 22)),
          const SizedBox(width: 4),
        ],
      ),
      body: Column(children: [const SizedBox(height: 16)]),
      bottomNavigationBar: _buildShareButton(context),
    );
  }

  Widget _buildShareButton(BuildContext context) {
    final colors = context.color;
    return DecoratedBox(
      decoration: BoxDecoration(
        color: colors.card,
        border: Border(top: BorderSide(color: colors.border)),
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: CustomButtonWidget(
            text: LocaleKeys.detail_share.tr(),
            height: 42,
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}
