import 'package:flutter/material.dart';

class DevInfoPage extends StatelessWidget {
  const DevInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Informações de Desenvolvimento"),
        centerTitle: true,
      ),
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Desenvolvido por: Denys Rafael Nobre de Oliveira"),
        ],
      ),
    );
  }
}
