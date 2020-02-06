import 'package:demo_app/dashboard_page.dart';
import 'package:demo_app/favorite_video_list_page.dart';
import 'package:demo_app/search_page.dart';
import 'package:demo_app/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    DashboardPage(),
    SearchPage(),
    FavoritesPage(),
    SettingsPage(),
  ];
  String titlePage(int index) {
    switch (index) {
      case 0:
        return 'Dashboard';
        break;
      case 1:
        return 'Search';
        break;
      case 2:
        return 'Favorite';
        break;
      case 3:
        return 'Settings';
        break;
      default:
    }
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(titlePage(_currentIndex)),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Text('Drawer'),
                decoration: BoxDecoration(color: Colors.green),
              ),
              ListTile(
                title: Text('Dashboard'),
                leading: Icon(Icons.movie),
                onTap: () {
                  onTabTapped(0);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Search'),
                leading: Icon(Icons.search),
                onTap: () {
                  onTabTapped(1);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Favorite'),
                leading: Icon(Icons.favorite),
                onTap: () {
                  onTabTapped(2);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Settings'),
                leading: Icon(Icons.settings),
                onTap: () {
                  onTabTapped(3);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text(
                  'Logout',
                  style: TextStyle(color: Colors.red),
                ),
                leading: Icon(Icons.do_not_disturb_on),
                onTap: () async {
                  final SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  await prefs.setString('token', null);
                  print('Success Logout');
                  Navigator.of(context).pushReplacementNamed('/login');
                },
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            onTap: onTabTapped,
            currentIndex: _currentIndex,
            items: [
              new BottomNavigationBarItem(
                  icon: _currentIndex == 0
                      ? Icon(Icons.movie_filter)
                      : Icon(Icons.movie),
                  title: Text('Dashboard')),
              new BottomNavigationBarItem(
                  icon: _currentIndex == 1
                      ? Icon(Icons.find_in_page)
                      : Icon(Icons.search),
                  title: Text('Search')),
              new BottomNavigationBarItem(
                  icon: _currentIndex == 2
                      ? Icon(Icons.favorite)
                      : Icon(Icons.favorite_border),
                  title: Text('Favorite')),
              new BottomNavigationBarItem(
                  icon: _currentIndex == 3
                      ? Icon(Icons.settings_applications)
                      : Icon(Icons.settings),
                  title: Text('Settings')),
            ]),
        body: _children[_currentIndex]);
  }
}
