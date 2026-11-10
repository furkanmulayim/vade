import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../shared/constants/locale_keys.g.dart';
import '../../../../shared/extensions/context_extension.dart';
import '../../../../shared/widgets/custom_sheet_widget.dart';
import '../../../../shared/enums/filter_enum.dart';

class FilterWidget extends StatefulWidget {
  const FilterWidget({super.key, required this.selected});

  final FilterEnum selected;

  @override
  State<FilterWidget> createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<FilterWidget> {
  late FilterEnum _selected = widget.selected;

  void _selectFilter(FilterEnum filter) {
    setState(() => _selected = filter);
  }

  @override
  Widget build(BuildContext context) {
    return CustomSheetWidget(
      title: LocaleKeys.home_sort.tr(),
      onButtonPressed: () => Navigator.pop(context, _selected),
      isButtonDisabled: _selected == widget.selected,
      content: RadioGroup<FilterEnum>(
        groupValue: _selected,
        onChanged: (filter) {
          if (filter != null) _selectFilter(filter);
        },
        child: Column(
          spacing: 8,
          children: FilterEnum.values.map(_buildFilterItem).toList(),
        ),
      ),
    );
  }

  Widget _buildFilterItem(FilterEnum filter) {
    final colors = context.color;
    final isSelected = filter == _selected;

    return Material(
      color: colors.card,
      borderRadius: BorderRadius.circular(14),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () => _selectFilter(filter),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
          child: Row(
            spacing: 8,
            children: [
              CupertinoRadio<FilterEnum>(
                value: filter,
                activeColor: colors.primary,
                inactiveColor: colors.border,
                fillColor: colors.card,
              ),
              Expanded(
                child: Text(
                  filter.titleKey.tr(),
                  style: context.typo.size14(
                    color: isSelected ? colors.primary : colors.textSecondary,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
