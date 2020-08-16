import 'package:brew_crew/services/auth.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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
        title: Text('Sign up'),
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
                    'Register',
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
