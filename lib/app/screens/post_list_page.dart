import 'package:flutter/material.dart';

class PostListPage extends StatelessWidget {
  const PostListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Meus Posts"),
        centerTitle: true,
      ),
      body: const Text("Ola posts"),
    );
  }
}
