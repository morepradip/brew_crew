import 'package:brew_crew/screens/authenticate/sign_in.dart';
import 'package:brew_crew/services/auth.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final Auth _auth = Auth();

  _signOut() async {
    await _auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        title: Text('Brew Crew'),
        actions: <Widget>[
          FlatButton(
            onPressed: _signOut,
            child: Text('Sign out'),
          )
        ],
      ),
    );
  }
}
