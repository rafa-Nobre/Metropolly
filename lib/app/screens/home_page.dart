import 'package:flutter/material.dart';
import 'package:metropolly/app/common/widgets/app_drawer.dart';
import 'package:metropolly/app/common/widgets/appbar.dart';
import 'package:metropolly/app/screens/feed_page.dart';
import 'package:metropolly/app/screens/notifications_page.dart';
import 'package:metropolly/app/screens/settings_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _pageIndex = 0;
  final List<Widget> _pages = [
    const NotificationsPage(),
    const FeedPage(),
    const SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: applicationAppbar("Home", context),
      drawer: const AppDrawer(),
      body: _pages[_pageIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _pageIndex,
        onTap: (currentIndex) {
          setState(() {
            _pageIndex = currentIndex;
          });
        },
        selectedItemColor: Colors.amber,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: "Notificações",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: "Criar",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Ajustes",
          ),
        ],
      ),
    );
  }
}
