import 'package:flutter/material.dart';

class StarredPage extends StatelessWidget {
  const StarredPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favoritos"),
        centerTitle: true,
      ),
      body: const Text("Favoritos"),
    );
  }
}
