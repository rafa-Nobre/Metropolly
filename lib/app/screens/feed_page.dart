import 'package:flutter/material.dart';
import 'package:metropolly/app/common/constants/metrics.dart';
import 'package:metropolly/app/common/widgets/post_card.dart';

class FeedPage extends StatelessWidget {
  const FeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(defaultSpacing),
      child: Column(
        children: [
          FeedItemCard(),
          SizedBox(height: 16),
          FeedItemCard(),
          SizedBox(height: 16),
          FeedItemCard(),
        ],
      ),
    );
  }
}
