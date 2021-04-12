import 'package:fashion_point/main.dart';
import 'package:fashion_point/pages/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  SharedPreferences preferences;
  bool loading = false;
  bool isLoggedin = false;

  @override
  void initState() {
    super.initState();
    isSignedin();
  }

  void isSignedin() async {
    setState(() {
      loading = true;
    });
    preferences = await SharedPreferences.getInstance();
    isLoggedin = await googleSignIn.isSignedIn();
    if (isLoggedin == true) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (contect) => Home()));
    }
    setState(() {
      loading = false;
    });
  }

  Future handleSignIn() async {
    preferences = await SharedPreferences.getInstance();
    setState(() {
      loading = true;
    });
    GoogleSignInAccount googleUser = await googleSignIn.signIn();
    GoogleSignInAuthentication googleSignInAuthentication =
        await googleUser.authentication;
    AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);

    User firebaseUser =
        (await firebaseAuth.signInWithCredential(credential)).user;
    if (User != null) {
      final QuerySnapshot result = await FirebaseFirestore.instance
          .collection("users")
          .where("id", isEqualTo: firebaseUser.uid)
          .get();
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
