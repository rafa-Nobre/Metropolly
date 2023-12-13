import 'package:flutter/material.dart';
import '../common/constants/metrics.dart';

class StarredPage extends StatelessWidget {
  const StarredPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Posts Salvos"),
        centerTitle: true,
        actions: const <Widget>[
          IconButton(
            onPressed: null,
            icon: Icon(Icons.search),
            splashRadius: 24.0,
          ),
          IconButton(
            splashRadius: 24.0,
            onPressed: null,
            icon: Icon(Icons.filter_alt_rounded),
          ),
        ],
      ),
      body: const Padding(
        padding: EdgeInsets.all(defaultSpacing),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // FeedItemCard(),
              // SizedBox(height: 16),
              // FeedItemCard(),
              // SizedBox(height: 16),
              // FeedItemCard(),
            ],
          ),
        ),
      ),
    );
  }
}
