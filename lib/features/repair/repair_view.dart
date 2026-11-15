import 'package:auto_route/auto_route.dart';
import 'package:material_ui/material_ui.dart';

@RoutePage()
class RepairView extends StatelessWidget {
  const RepairView({super.key});

  @override
  Widget build(BuildContext context) => const Scaffold(
    body: SafeArea(child: Center(child: Text('Bakım'))),
  );
}
