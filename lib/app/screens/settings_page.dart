import 'package:flutter/material.dart';
import 'package:metropolly/app/common/colors/app_colors.dart';
import 'package:metropolly/app/common/constants/metrics.dart';
import 'package:metropolly/app/common/widgets/common_text.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _isDarkTheme = false;
  bool _isNotificationsActive = true;

  void _switchTheme(bool value) {
    setState(() {
      _isDarkTheme = value;
    });
  }

  void _switchNotifications(bool value) {
    setState(() {
      _isNotificationsActive = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Configurações"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(defaultSpacing),
        child: Column(
          children: <Widget>[
            SizedBox(
              width: width,
              height: height / 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Switch(value: _isDarkTheme, onChanged: (value) => _switchTheme(value)),
                      const CommonText(text: "Alterar tema"),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Switch(value: _isNotificationsActive, onChanged: (value) => _switchNotifications(value)),
                      const CommonText(text: "Ativar/Desativar Notificações"),
                    ],
                  ),
                ],
              ),
            ),
            const Expanded(child: SizedBox()),
            ElevatedButton(
              onPressed: null,
              style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(secondaryColor)),
              child: const CommonText(
                text: "Informações do desenvolvedor",
              ),
            ),
            const SizedBox(height: extraLargeSpacing),
          ],
        ),
      ),
    );
  }
}
