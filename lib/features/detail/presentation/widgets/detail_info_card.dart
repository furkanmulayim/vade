import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/locale_keys.g.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../../core/models/vade.dart';
import '../../../../core/widgets/custom_card_widget.dart';
import '../../../../core/widgets/custom_icon_widget.dart';
import '../../../categories/domain/enums/category_enum.dart';

class DetailInfoCard extends StatelessWidget {
  const DetailInfoCard({required this.vade, super.key});

  final Vade vade;

  @override
  Widget build(BuildContext context) {
    final colors = context.color;

    return CustomCardWidget(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 10,
            children: [
              Container(
                width: 44,
                height: 44,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: colors.border),
                ),
                child: CustomIconWidget(
                  path: vade.iconPath,
                  size: 22,
                  color: colors.textPrimary,
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 4,
                  children: [
                    Text(vade.name, style: context.typo.size16()),
                    if (vade.description.trim().isNotEmpty)
                      Text(
                        vade.description,
                        style: context.typo.size13(color: colors.textSecondary),
                      ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Divider(height: 1),
          const SizedBox(height: 12),
          Row(
            spacing: 12,
            children: [
              Text(
                LocaleKeys.detail_category.tr(),
                style: context.typo.size13(color: colors.textSecondary),
              ),
              const Spacer(),
              Expanded(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: colors.border),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      spacing: 6,
                      children: [
                        CustomIconWidget(
                          path: vade.category.icon,
                          size: 16,
                          color: colors.textSecondary,
                        ),
                        Flexible(
                          child: Text(
                            vade.category.titleKey.tr(),
                            style: context.typo.size13(
                              color: colors.textSecondary,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
