import 'package:flutter/material.dart';
import 'package:metropolly/app/common/widgets/app_drawer.dart';
import 'package:metropolly/app/screens/feed_page.dart';
import 'package:metropolly/app/screens/notifications_page.dart';
import 'package:metropolly/app/screens/post_creation_page.dart';
import '../routes/routes_consts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _pageIndex = 0;
  final List<Widget> _pages = [
    const FeedPage(),
    const PostCreationPage(),
    const NotificationsPage(),
  ];

  String _appbarTitle = "";

  @override
  void initState() {
    _appbarTitle = "Feed";
    super.initState();
  }

  void changePage(int currentIndex) {
    setState(() {
      _pageIndex = currentIndex;
      if (_pageIndex == 0) {
        _appbarTitle = "Feed";
      } else if (_pageIndex == 1) {
        _appbarTitle = "Novo Post";
      } else if (_pageIndex == 2) {
        _appbarTitle = "Notificações";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_appbarTitle),
        centerTitle: true,
        actions: [
          Visibility(
            visible: _pageIndex == 0,
            child: const IconButton(
              onPressed: null,
              icon: Icon(Icons.search),
              splashRadius: 24.0,
            ),
          ),
          IconButton(
            splashRadius: 24.0,
            onPressed: () => Navigator.of(context).pushNamed(RoutesConsts.profile),
            icon: const Icon(Icons.person),
          ),
        ],
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
      body: _pages[_pageIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _pageIndex,
        onTap: (currentIndex) => changePage(currentIndex),
        selectedItemColor: Colors.amber,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt),
            label: "Feed",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: "Criar",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: "Notificações",
          ),
        ],
      ),
    );
  }
}
