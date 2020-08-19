import 'dart:io';
import 'dart:ui';

import 'package:brew_crew/models/user.dart';
import 'package:brew_crew/services/auth.dart';
import 'package:brew_crew/shared/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  final Function toggleSignInRegisterScreen;
  SignIn({this.toggleSignInRegisterScreen});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final Auth _auth = Auth();
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  String error = '';

  _toggleScreen() {
    widget.toggleSignInRegisterScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        title: Text('Sign In'),
        backgroundColor: Colors.brown[400],
        actions: <Widget>[
          FlatButton.icon(
            onPressed: _toggleScreen,
            icon: Icon(Icons.person),
            label: Text('Register'),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
            padding: EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 50,
            ),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: inputDecoration.copyWith(hintText: 'Email'),
                    validator: (value) =>
                        value.isEmpty ? 'Enter an email' : null,
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
                    decoration: inputDecoration.copyWith(hintText: 'Password'),
                    validator: (value) =>
                        value.length < 6 ? 'Password must be 8 or more ' : null,
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
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        dynamic user = await _auth.signInWithEmailAndPassword(
                            email, password);
                        if (user == null) {
                          setState(() {
                            error = 'Invalid Credentials';
                          });
                        }
                      }
                    },
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(error),
                ],
              ),
            )),
      ),
    );
  }
}
