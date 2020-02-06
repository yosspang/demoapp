import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _validate = true;
  TextEditingController _token = TextEditingController();

  void doLogin() async {
    if (_formKey.currentState.validate()) {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', _token.text);
      print('Success save token ${_token.text}');
      Navigator.of(context).pushReplacementNamed('/home');
    } else
      setState(() {
        _validate = true;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(60.0),
        child: Form(
          key: _formKey,
          autovalidate: _validate,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Login',
                  style: TextStyle(fontSize: 30),
                ),
                SizedBox(
                  height: 60,
                ),
                TextFormField(
                  validator: (String value) =>
                      value.isEmpty ? 'Token cannot be empty' : null,
                  controller: _token,
                  decoration: InputDecoration(
                      hintText: 'Input your token',
                      prefixIcon: Icon(Icons.vpn_key)),
                ),
                SizedBox(
                  height: 30,
                ),
                RaisedButton(
                  child: Text(
                    'Login',
                    style: TextStyle(fontSize: 15),
                  ),
                  onPressed: doLogin,
                  color: Colors.green,
                  textColor: Colors.white,
                  padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
