import 'package:flutter/material.dart';
import 'package:metropolly/app/common/widgets/app_drawer.dart';
import 'package:metropolly/app/common/widgets/appbar.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: applicationAppbar('Notificações', context),
      body: Text('Olá Notificações'),
      drawer: AppDrawer(),
    );
  }
}
