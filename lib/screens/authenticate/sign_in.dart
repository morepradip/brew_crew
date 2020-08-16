import 'dart:ui';

import 'package:brew_crew/models/user.dart';
import 'package:brew_crew/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final Auth _auth = Auth();
  String email = '';
  String password = '';

/*
  _signInAnon() async {
    User result = await _auth.signInAnon();
    if (result != null) {
      print('User singed in');
      print(result.uid);
    } else {
      print('Error in sign in');
    }
  }
*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        title: Text('Sign In'),
        backgroundColor: Colors.brown[400],
      ),
      body: Container(
          padding: EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 50,
          ),
          child: Form(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  onChanged: (value) {
                    setState(() {
                      email = value;
                    });
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  obscureText: true,
                  onChanged: (value) {
                    setState(() {
                      password = value;
                    });
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                RaisedButton(
                  color: Colors.pink,
                  child: Text(
                    'Sign in',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    print(email);
                    print(password);
                  },
                )
              ],
            ),
          )),
    );
  }
}
