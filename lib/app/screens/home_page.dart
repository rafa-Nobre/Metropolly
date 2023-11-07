import 'package:flutter/material.dart';
import 'package:metropolly/app/common/widgets/app_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: const Text(
          'Feed',
          style: TextStyle(color: Colors.white),
        ),
        leading: Builder(
          builder: (context) {
            return IconButton(
              onPressed: () => Scaffold.of(context).openDrawer(),
              icon: const Icon(
                Icons.menu,
                color: Colors.white,
              ),
            );
          },
        ),
      ),
      drawer: const AppDrawer(),
      body: Center(
        child: Text(
          'Hello World',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      floatingActionButton: const FloatingActionButton(
        onPressed: null,
        tooltip: 'Adicionar post',
        backgroundColor: Colors.indigo,
        shape: CircleBorder(),
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
