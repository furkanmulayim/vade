import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:vade/shared/constants/asset_path.dart';
import 'package:vade/shared/widgets/custom_icon_widget.dart';

import '../../core/models/due_date_status.dart';
import '../../shared/constants/locale_keys.g.dart';
import '../../shared/extensions/context_extension.dart';
import '../../shared/extensions/due_date_status_extension.dart';
import '../../shared/enums/category_enum.dart';
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
      body: SingleChildScrollView(
        child: Column(
          children: [_buildHeader(context), _buildProgress(context)],
        ),
      ),
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
                size: 24,
                color: context.color.textPrimary,
                border: true,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: .start,
                  spacing: 2,
                  children: [
                    Text(
                      vade.name,
                      style: context.typo.size14(weight: FontWeight.w600),
                    ),
                    if (vade.description.isNotEmpty)
                      Text(
                        vade.description,
                        style: context.typo.size12(
                          color: context.color.textSecondary,
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildProgress(BuildContext context) {
    final status = DueDateStatus.calculate(
      vade.endDate,
      startDate: vade.startDate,
    );
    final colors = context.color;
    final progressColor = status.color(colors);

    return EmptyCardWidget(
      margin: EdgeInsetsGeometry.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 12,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 8,
            children: [
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  spacing: 8,
                  children: [
                    CustomIconWidget(
                      path: AssetPath.watch,
                      size: 24,
                      color: progressColor,
                      border: true,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 2,
                        children: [
                          Text(
                            LocaleKeys.detail_remaining.tr(),
                            style: context.typo.size12(
                              color: context.color.textSecondary,
                            ),
                          ),
                          Text(
                            status.label(),
                            style: context.typo.size16(
                              weight: FontWeight.w700,
                              color: progressColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              EmptyCardWidget(
                width: null,
                margin: EdgeInsets.zero,
                padding: EdgeInsetsGeometry.symmetric(
                  horizontal: 8,
                  vertical: 6,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  spacing: 5,
                  children: [
                    CustomIconWidget(
                      path: vade.category.icon,
                      size: 14,
                      color: colors.textSecondary,
                    ),
                    Text(
                      vade.category.titleKey.tr(),
                      style: context.typo.size12(color: colors.textSecondary),
                    ),
                  ],
                ),
              ),
            ],
          ),
          LinearProgressIndicator(
            value: 1 - status.progress,
            minHeight: 8,
            borderRadius: BorderRadius.circular(8),
            backgroundColor: colors.border,
            color: progressColor,
          ),
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
