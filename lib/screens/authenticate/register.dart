import 'dart:developer';

import 'package:brew_crew/services/auth.dart';
import 'package:brew_crew/shared/constants.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  final Function toggleSignInRegisterScreen;
  Register({this.toggleSignInRegisterScreen});
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final Auth _auth = Auth();
  final _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String error = '';

  _toggleScreen() {
    widget.toggleSignInRegisterScreen();
  }

  Future _registerWithEmailAndPassword() async {
    await _auth.registerWithEmailAndPassword(email, password);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        title: Text('Sign up'),
        backgroundColor: Colors.brown[400],
        actions: <Widget>[
          FlatButton.icon(
            onPressed: _toggleScreen,
            icon: Icon(Icons.person),
            label: Text('Sign in'),
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
                        'Register',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () async {
                        dynamic result = await _auth
                            .registerWithEmailAndPassword(email, password);
                        if (result == null) {
                          setState(() {
                            error = 'Please supply valid email';
                          });
                        }
                      }),
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
