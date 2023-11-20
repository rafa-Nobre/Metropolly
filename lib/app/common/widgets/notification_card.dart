import 'package:flutter/material.dart';
import '../constants/metrics.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: null,
      child: Container(
        padding: const EdgeInsets.all(minorSpacing),
        width: width,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.elliptical(8, 8)),
          color: Colors.grey.shade400,
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(Icons.person),
            Text("Maria respondeu seu comentário"),
            Icon(Icons.arrow_forward),
          ],
        ),
      ),
    );
  }
}
