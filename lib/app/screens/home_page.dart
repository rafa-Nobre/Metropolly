import 'package:flutter/material.dart';
import 'package:metropolly/app/common/colors/app_colors.dart';
import 'package:metropolly/app/common/widgets/app_drawer.dart';
import 'package:metropolly/app/common/widgets/appbar.dart';
import 'package:metropolly/app/screens/feed_page.dart';
import 'package:metropolly/app/screens/profile_page.dart';
import 'package:metropolly/app/screens/settings_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _pageIndex = 0;
  final List<Widget> _pages = [
    ProfilePage(),
    FeedPage(),
    SettingsPage(),
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
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Perfil",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Feed",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Configurações",
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        tooltip: 'Adicionar post',
        backgroundColor: primaryColor,
        shape: const CircleBorder(),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
