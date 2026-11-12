import 'package:auto_route/auto_route.dart';
import 'package:blurred_overlay/blurred_overlay.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../core/models/due_date_status.dart';
import '../../core/models/vade.dart';
import '../../shared/constants/asset_path.dart';
import '../../shared/constants/locale_keys.g.dart';
import '../../shared/enums/category_enum.dart';
import '../../shared/extensions/context_extension.dart';
import '../../shared/extensions/due_date_status_extension.dart';
import '../../shared/widgets/custom_button_widget.dart';
import '../../shared/widgets/custom_icon_widget.dart';
import '../../shared/widgets/empty_card_widget.dart';

@RoutePage()
class DetailView extends StatelessWidget {
  const DetailView({required this.vade, super.key});

  final Vade vade;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: BlurredAppBar(
        backgroundColor: context.color.card.withValues(alpha: 0.72),
        title: Text(LocaleKeys.detail_title.tr()),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.edit, size: 22)),
          const SizedBox(width: 4),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          top: MediaQuery.paddingOf(context).top + kToolbarHeight,
        ),
        child: Column(
          children: [
            _buildHeader(context),
            _buildProgress(context),
            _buildDates(context),
            _buildSection(
              context,
              title: LocaleKeys.detail_reminder.tr(),
              child: _buildReminder(context),
            ),
            _buildFiles(context),
          ],
        ),
      ),
      bottomNavigationBar: _buildShareButton(context),
    );
  }

  Widget _buildHeader(BuildContext context) {
    final colors = context.color;
    return EmptyCardWidget(
      child: Row(
        spacing: 8,
        children: [
          CustomIconWidget(
            path: AssetPath.navHome,
            size: 24,
            color: colors.textPrimary,
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
                    style: context.typo.size12(color: colors.textSecondary),
                  ),
              ],
            ),
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
      margin: .symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: .start,
        spacing: 12,
        children: [
          Row(
            crossAxisAlignment: .start,
            spacing: 8,
            children: [
              Expanded(
                child: Row(
                  crossAxisAlignment: .center,
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
                        crossAxisAlignment: .start,
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
                margin: .zero,
                padding: .symmetric(horizontal: 8, vertical: 6),
                child: Row(
                  mainAxisSize: .min,
                  mainAxisAlignment: .start,
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
            value: status.progress,
            minHeight: 8,
            borderRadius: .circular(8),
            backgroundColor: colors.border,
            color: progressColor,
          ),
        ],
      ),
    );
  }

  Widget _buildDates(BuildContext context) {
    final dateFormat = DateFormat('d MMM yyyy', context.locale.toString());
    return _buildSection(
      context,
      title: LocaleKeys.detail_dates.tr(),
      child: Column(
        children: [
          _rowItem(
            context,
            iconPath: AssetPath.calendar,
            title: LocaleKeys.detail_start_date.tr(),
            endTitle: dateFormat.format(vade.startDate),
          ),
          Divider(height: 1, thickness: 1, color: context.color.border),
          _rowItem(
            context,
            iconPath: AssetPath.calendar,
            title: LocaleKeys.detail_end_date.tr(),
            endTitle: dateFormat.format(vade.endDate),
          ),
        ],
      ),
    );
  }

  Widget _buildFiles(BuildContext context) {
    return _buildSection(
      context,
      title: LocaleKeys.detail_files.tr(),
      child: _rowItem(
        context,
        iconPath: AssetPath.calendar,
        title: LocaleKeys.detail_no_files.tr(),
      ),
    );
  }

  Widget _buildSection(
    BuildContext context, {
    required String title,
    required Widget child,
  }) {
    return Column(
      crossAxisAlignment: .stretch,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(28, 16, 20, 8),
          child: Text(
            title,
            style: context.typo.size12(color: context.color.textSecondary),
          ),
        ),
        EmptyCardWidget(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: child,
        ),
      ],
    );
  }

  Widget _rowItem(
    BuildContext context, {
    required String iconPath,
    required String title,
    String? endTitle,
  }) {
    final colors = context.color;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        spacing: 12,
        children: [
          CustomIconWidget(
            path: iconPath,
            size: 20,
            color: colors.textSecondary,
          ),
          Expanded(
            child: Text(
              title,
              style: context.typo.size14(color: colors.textSecondary),
            ),
          ),
          if (endTitle != null)
            Expanded(
              child: Text(
                endTitle,
                textAlign: TextAlign.end,
                style: context.typo.size14(color: colors.textPrimary),
              ),
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
          padding: const .symmetric(horizontal: 16, vertical: 12),
          child: CustomButtonWidget(
            text: LocaleKeys.detail_share.tr(),
            height: 42,
            onPressed: () {},
          ),
        ),
      ),
    );
  }

  Widget _buildReminder(BuildContext context) {
    var enabled = false;
    var daysBefore = 1;

    return StatefulBuilder(
      builder: (context, setState) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Theme(
            data: Theme.of(context).copyWith(
              splashFactory: NoSplash.splashFactory,
              highlightColor: Colors.transparent,
              hoverColor: Colors.transparent,
            ),
            child: Material(
              type: MaterialType.transparency,
              child: SwitchListTile.adaptive(
                applyCupertinoTheme: false,
                trackColor: Theme.of(context).switchTheme.trackColor,
                contentPadding: EdgeInsets.zero,
                title: Text(
                  LocaleKeys.detail_remind_me.tr(),
                  style: context.typo.size14(
                    color: context.color.textSecondary,
                  ),
                ),
                value: enabled,
                onChanged: (value) => setState(() => enabled = value),
              ),
            ),
          ),
          if (enabled)
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Row(
                spacing: 8,
                children: [
                  for (final days in [1, 3, 7])
                    _buildReminderChip(
                      days,
                      daysBefore,
                      () => setState(() => daysBefore = days),
                    ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildReminderChip(int days, int selectedDays, VoidCallback onTap) {
    return Expanded(
      child: ChoiceChip(
        label: SizedBox(
          width: double.infinity,
          child: Text(
            LocaleKeys.detail_reminder_days_before.plural(days, name: 'count'),
            textAlign: TextAlign.center,
          ),
        ),
        selected: selectedDays == days,
        onSelected: (_) => onTap(),
      ),
    );
  }
}
