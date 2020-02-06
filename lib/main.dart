import 'package:demo_app/dashboard_page.dart';
import 'package:demo_app/favorite_video_list_page.dart';
import 'package:demo_app/home_page.dart';
import 'package:demo_app/login_page.dart';
import 'package:demo_app/search_page.dart';
import 'package:demo_app/settings_page.dart';
import 'package:demo_app/splash_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // brightness: Brightness.light,
        primaryColor: Colors.green,
        accentColor: Colors.cyan[600],
        fontFamily: 'Monsterrat',
        textTheme: TextTheme(
          headline: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          title: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          // body1: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
        ),
      ),
      home: SplashPage(),
      routes: <String, WidgetBuilder>{
        '/home': (BuildContext context) => HomePage(),
        '/login': (BuildContext context) => LoginPage(),
        '/dashboard': (BuildContext context) => DashboardPage(),
        '/search': (BuildContext context) => SearchPage(),
        '/favorite': (BuildContext context) => FavoritesPage(),
        '/settings': (BuildContext context) => SettingsPage(),
      },
    );
  }
}
