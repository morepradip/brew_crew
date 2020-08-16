import 'package:brew_crew/models/user.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User _userFromFirebseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  Stream<User> get user {
    return _auth.onAuthStateChanged.map(_userFromFirebseUser);
  }

  // sign in Anon

  Future signInAnon() async {
    try {
      AuthResult authResult = await _auth.signInAnonymously();
      FirebaseUser user = authResult.user;
      return _userFromFirebseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // sign in with email and password

  // register with email and password

  //sign out

  Future signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }
}
