import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  loadingTime() async {
    final _duration = new Duration(seconds: 4);
    return new Timer(_duration, checkLogin);
  }

  checkLogin() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String _token = prefs.getString('token');
    print(_token);
    String route = _token == null ? '/login' : '/home';
    Navigator.of(context).pushReplacementNamed(route);
  }

  @override
  void initState() {
    super.initState();
    loadingTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Image.asset('assets/loader.gif'),
          ),
          SizedBox(
            height: 30.0,
          ),
          Text('Video App is loading...',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ))
        ],
      ),
    );
  }
}
