import 'package:flutter/material.dart';
import 'package:metropolly/app/common/widgets/app_drawer.dart';
import 'package:metropolly/app/screens/feed_page.dart';
import 'package:metropolly/app/screens/notifications_page.dart';
import '../routes/routes_consts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _pageIndex = 0;
  String _appbarTitle = "";

  @override
  void initState() {
    _appbarTitle = "Feed";
    super.initState();
  }

  void changePage(int currentIndex) {
    if (currentIndex == 1) {
      Navigator.of(context).pushNamed(RoutesConsts.newPost);
    } else {
      setState(() {
        _pageIndex = currentIndex;
        if (_pageIndex == 0) {
          _appbarTitle = "Feed";
        } else {
          _appbarTitle = "Notificações";
        }
      });
    }
  }

  Widget _screenBuilder(int index) {
    switch (index) {
      case 0:
        return const FeedPage();
      case 1:
        return const SizedBox();
      case 2:
        return const NotificationsPage();
      default:
        return const SizedBox();
    }
  }

  //Future<void> onFilterPress(BuildContext context) => showModalBottomSheet(context: context, builder: () { return BottomSheet(onClosing: onClosing, builder: builder)});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_appbarTitle),
        centerTitle: true,
        actions: [
          const IconButton(
            onPressed: null,
            icon: Icon(Icons.search),
            splashRadius: 24.0,
          ),
          const IconButton(
            splashRadius: 24.0,
            onPressed: null,
            icon: Icon(Icons.filter_alt_rounded),
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
      body: _screenBuilder(_pageIndex),
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
