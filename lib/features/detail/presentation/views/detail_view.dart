import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/locale_keys.g.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../../core/models/vade.dart';
import '../../../../core/widgets/custom_button_widget.dart';

import '../widgets/detail_dates_card.dart';
import '../widgets/detail_files_card.dart';
import '../widgets/detail_info_card.dart';
import '../widgets/detail_status_card.dart';

@RoutePage()
class DetailView extends StatelessWidget {
  const DetailView({required this.vade, super.key});

  final Vade vade;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.tr(LocaleKeys.detail_title)),
        actions: [
          IconButton(
            onPressed: null,
            icon: const Icon(Icons.edit_outlined, size: 22),
          ),
          const SizedBox(width: 4),
        ],
      ),
      body: SafeArea(
        bottom: false,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            DetailInfoCard(vade: vade),
            const SizedBox(height: 12),
            DetailStatusCard(startDate: vade.startDate, endDate: vade.endDate),
            _buildSectionTitle(context, LocaleKeys.detail_dates),
            DetailDatesCard(startDate: vade.startDate, endDate: vade.endDate),
            _buildSectionTitle(context, LocaleKeys.detail_files),
            DetailFilesCard(documentCount: vade.documentCount),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomBar(context),
    );
  }

  Widget _buildBottomBar(BuildContext context) {
    final colors = context.color;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: colors.card,
        border: Border(top: BorderSide(color: colors.border)),
      ),
      child: SafeArea(
        top: false,
        child: SizedBox(
          height: 70,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 11),
            child: CustomButtonWidget(
              text: context.tr(LocaleKeys.detail_share),
              height: 48,
              isDisabled: true,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String key) {
    return Padding(
      padding: const EdgeInsets.only(left: 4, top: 24, bottom: 10),
      child: Text(
        context.tr(key),
        style: context.typo.size12(color: context.color.textSecondary),
      ),
    );
  }
}
