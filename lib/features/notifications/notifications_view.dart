import 'package:auto_route/auto_route.dart';
import 'package:material_ui/material_ui.dart';

@RoutePage()
class NotificationsView extends StatelessWidget {
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: Text("Bildirimler")),
    body: SafeArea(child: Center(child: Text("Bildirimler"))),
  );
}
