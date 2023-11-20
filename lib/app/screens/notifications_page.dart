import 'package:flutter/material.dart';
import 'package:metropolly/app/common/constants/metrics.dart';
import 'package:metropolly/app/common/widgets/notification_card.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(defaultSpacing),
      child: Column(
        children: [
          NotificationCard(),
          SizedBox(height: defaultSpacing),
          NotificationCard(),
          SizedBox(height: defaultSpacing),
          NotificationCard(),
        ],
      ),
    );
  }
}
