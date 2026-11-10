import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:vade/shared/constants/asset_path.dart';
import 'package:vade/shared/widgets/custom_icon_widget.dart';

import '../../shared/constants/locale_keys.g.dart';
import '../../shared/extensions/context_extension.dart';
import '../../core/models/vade.dart';
import '../../shared/widgets/custom_button_widget.dart';
import '../../shared/widgets/empty_card_widget.dart';

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
      body: Column(children: [_buildHeader(context)]),
      bottomNavigationBar: _buildShareButton(context),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return EmptyCardWidget(
      child: Column(
        spacing: 8,
        children: [
          Row(
            spacing: 8,
            children: [
              CustomIconWidget(
                path: AssetPath.navHome,
                size: 20,
                color: context.color.textPrimary,
                border: true,
              ),
              Column(
                crossAxisAlignment: .start,
                children: [
                  // TO DO 
                  // Text(
                  //   vade.name,
                  //   style: context.typo.size14(weight: FontWeight.w600),
                  // ),
                  // if (vade.description.isNotEmpty)
                  //   Text(
                  //     vade.description,
                  //     style: context.typo.size12(
                  //       color: context.color.textSecondary,
                  //     ),
                  //   ),
                ],
              ),
            ],
          ),
          Divider(),
        ],
      ),
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
