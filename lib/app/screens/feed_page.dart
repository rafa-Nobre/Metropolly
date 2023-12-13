import 'package:flutter/material.dart';
import 'package:metropolly/app/common/constants/metrics.dart';
import 'package:metropolly/app/common/widgets/post_card.dart';
import 'package:metropolly/app/core/services/post_service.dart';
import '../core/models/post_model.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({super.key});

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  List<PostModel> list = [];

  void fetchList() async {
    final service = PostService();
    await service.getAllPosts().then((value) {
      list = value;
    });
  }

  @override
  void initState() {
    fetchList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(defaultSpacing),
      child: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          return FeedItemCard(
            title: list[index].title,
            description: list[index].description,
            isOportunity: list[index].isOportunity,
          );
        },
      ),
    );
  }
}
