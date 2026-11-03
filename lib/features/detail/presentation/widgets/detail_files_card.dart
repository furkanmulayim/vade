import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/asset_path.dart';
import '../../../../core/constants/locale_keys.g.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../../core/widgets/custom_card_widget.dart';
import '../../../../core/widgets/custom_icon_widget.dart';

class DetailFilesCard extends StatelessWidget {
  const DetailFilesCard({required this.documentCount, super.key});

  final int documentCount;

  @override
  Widget build(BuildContext context) {
    final colors = context.color;
    final hasFiles = documentCount > 0;

    return CustomCardWidget(
      child: Row(
        spacing: 12,
        children: [
          CustomIconWidget(
            path: AssetPath.navDocuments,
            size: 24,
            color: colors.textSecondary,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 4,
              children: [
                Text(
                  hasFiles
                      ? context.plural(
                          LocaleKeys.due_documents,
                          documentCount,
                          name: 'count',
                        )
                      : context.tr(LocaleKeys.detail_no_files),
                  style: context.typo.size14(),
                ),
                if (hasFiles)
                  Text(
                    context.tr(LocaleKeys.detail_files_unavailable),
                    style: context.typo.size13(color: colors.textSecondary),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
