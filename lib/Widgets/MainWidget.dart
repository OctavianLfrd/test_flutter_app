import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:test_flutter_project/Widgets/IconScreen.dart';

class MainWidget extends StatelessWidget {
  MainWidget(this._content);

  final Widget _content;

  @override
  Widget build(BuildContext context) {

    debugPrint('Color --> ${Icon(Icons.home).color}');

    return Scaffold(
      appBar: AppBar(title: Text('Test Flutter Project')),
      body: Column(
        children: [
          Expanded(
            child: _content
          ),
          MainNavigationBar()
        ],
      ),
    );
  }
}

class MainNavigationBarState extends State<MainNavigationBar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _selectedIndex,
      unselectedItemColor: Colors.black54,
      showUnselectedLabels: true,
      selectedItemColor: Colors.redAccent,
      onTap: _onItemTap,
      items: [
        BottomNavigationBarItem(
          title: Text('Search'),
          icon: Icon(Icons.search),
          activeIcon: Icon(Icons.search),
          backgroundColor: Colors.white
        ),
        BottomNavigationBarItem(
          title: Text('Home'),
          icon: Icon(Icons.home),
          activeIcon: Icon(Icons.home),
          backgroundColor: Colors.white
        ),
        BottomNavigationBarItem(
          title: Text('Help'),
          icon: Icon(Icons.help),
          activeIcon: Icon(Icons.help),
          backgroundColor: Colors.white
        ),
        BottomNavigationBarItem(
          title: Text('Network'),
          icon: Icon(Icons.web),
          activeIcon: Icon(Icons.web),
          backgroundColor: Colors.white
        )
      ],
    );
  }

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
      _navigate();
    });
  }

  void _navigate() {
    Navigator.of(context).push(MaterialPageRoute<void>(builder: (context) => IconScreen(_getIconData())));
  }

  IconData _getIconData() {
    switch (_selectedIndex) {
      case 0:
        return Icons.search;
      case 1:
        return Icons.home;
      case 2:
        return Icons.help;
      case 3:
        return Icons.web;
    }
    throw 'No Such Icon specified in switch statement';
  }
}

class MainNavigationBar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MainNavigationBarState();
}