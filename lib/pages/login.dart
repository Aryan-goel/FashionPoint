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
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passswordTextController = TextEditingController();
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
      final List<DocumentSnapshot> documents = result.docs;
      if (documents.length == 0) {
        //*?insert the user into our collection

        FirebaseFirestore.instance
            .collection("users")
            .doc(firebaseUser.uid)
            .set({
          "id": firebaseUser.uid,
          "username": firebaseUser.displayName,
          "profilepicture": firebaseUser.photoURL
        });
        await preferences.setString("id", firebaseUser.uid);
        await preferences.setString("username", firebaseUser.displayName);
        await preferences.setString("photo", firebaseUser.photoURL);
      } else {
        await preferences.setString("id", documents[0]['id']);
        await preferences.setString("username", documents[0]['username']);
        await preferences.setString("photoURL", documents[0]['photoURL']);
      }
      Fluttertoast.showToast(msg: "Logged In");
      setState(() {
        loading = false;
      });
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: Stack(
        children: <Widget>[
          Image.asset(
            'images/cats/back.jpg',
            fit: BoxFit.cover,
            height: double.infinity,
          ),
          Container(
            color: Colors.black.withOpacity(0.4),
            width: double.infinity,
            height: double.infinity,
          ),
          SafeArea(
            child: Container(
              alignment: Alignment.center,
              child: Center(
                child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Material(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white.withOpacity(0.5),
                            elevation: 0,
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: TextFormField(
                                controller: _emailTextController,
                                decoration: InputDecoration(
                                  hintText: "Email",
                                  icon: Icon(
                                    Icons.email,
                                    color: Colors.white,
                                  ),
                                ),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    Pattern pattern =
                                        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                                    RegExp regex = new RegExp(pattern);
                                    if (!regex.hasMatch(value)) {
                                      return "Please make sure your email address is valid";
                                    } else {
                                      return null;
                                    }
                                  }
                                },
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Material(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white.withOpacity(0.5),
                            elevation: 0,
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: TextFormField(
                                controller: _passswordTextController,
                                decoration: InputDecoration(
                                  hintText: "Password",
                                  icon: Icon(
                                    Icons.lock_outline_rounded,
                                    color: Colors.white.withOpacity(1),
                                  ),
                                ),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return "the password field cannot be empty";
                                  } else if (value.length < 6) {
                                    return "the password has to be atleast 6 characteres ";
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                        )
                      ],
                    )),
              ),
            ),
          ),
          Visibility(
            visible: loading ?? true,
            child: Container(
              color: Colors.white.withOpacity(0.7),
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        child: Padding(
          padding:
              const EdgeInsets.only(left: 12, right: 12, top: 8, bottom: 8),
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.red[900],
              ),
              onPressed: () {
                handleSignIn();
              },
              child: Text(
                "Sign in / sign up with google",
                style: TextStyle(color: Colors.white, fontSize: 18),
              )),
        ),
      ),
    );
  }
}
