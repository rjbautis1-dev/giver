import 'package:flutter/material.dart';

import 'package:giver/src/screens/favorites_screen.dart';
import 'package:giver/src/screens/home_screen.dart';
import 'package:giver/src/screens/search_screen.dart';
import 'package:giver/src/screens/settings_screen.dart';

class ViewHandler extends StatefulWidget {
  ViewHandler({Key key}) : super(key: key);

  @override
  _ViewHandlerState createState() => _ViewHandlerState();
}

class _ViewHandlerState extends State<ViewHandler> {
  int _index = 0;

  void _changeIndex(int index) {
    setState(() {
      _index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: IndexedStack(
          index: _index,
          children: _views.map((Widget view) {
            return view;
          }).toList(),
        ),
      ),
      bottomNavigationBar: _buildNavigationBar(),
    );
  }

  BottomNavigationBar _buildNavigationBar() {
    return BottomNavigationBar(
      items: _buildNavigationBarItems(),
      currentIndex: _index,
      onTap: _changeIndex,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.amber[600],
    );
  }

  List<BottomNavigationBarItem> _buildNavigationBarItems() {
    return _viewInfo.map((_NavBarItem page) {
      return BottomNavigationBarItem(
        title: Text(page.title),
        icon: Icon(page.icon),
      );
    }).toList();
  }
}

class _NavBarItem {
  _NavBarItem({this.index, this.title, this.icon});
  final int index;
  final String title;
  final IconData icon;
}

List<_NavBarItem> _viewInfo = <_NavBarItem>[
  _NavBarItem(title: 'Home', icon: Icons.home),
  _NavBarItem(title: 'Favorites', icon: Icons.favorite),
  _NavBarItem(title: 'Search', icon: Icons.search),
  _NavBarItem(title: 'Settings', icon: Icons.settings),
];

List<Widget> _views = <Widget>[
  HomeScreen(),
  FavoritesScreen(),
  SearchScreen(),
  SettingsScreen(),
];
