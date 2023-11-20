import 'package:flutter/material.dart';

class PostInfoPage extends StatefulWidget {
  const PostInfoPage({super.key});

  @override
  State<PostInfoPage> createState() => _PostInfoPageState();
}

class _PostInfoPageState extends State<PostInfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const <Widget>[
          IconButton(
            onPressed: null,
            icon: Icon(Icons.search),
            splashRadius: 24.0,
          ),
        ],
      ),
      body: const Text("Ola"),
    );
  }
}
