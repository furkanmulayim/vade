import 'package:easy_localization/easy_localization.dart';
import 'package:material_ui/material_ui.dart';

import '../../shared/constants/locale_keys.g.dart';
import '../../shared/widgets/custom_sheet_widget.dart';

class CreateView extends StatelessWidget {
  const CreateView({super.key});

  @override
  Widget build(BuildContext context) => CustomSheetWidget(
    isFullScreen: true,
    title: LocaleKeys.navigation_create.tr(),
    onClose: () => Navigator.of(context).pop(),
    content: const SizedBox.shrink(),
  );
}
