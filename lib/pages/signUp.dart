import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passswordTextController = TextEditingController();
  TextEditingController _nameTextController = TextEditingController();
  TextEditingController _confirmTextController = TextEditingController();
  String gender;
  bool loading = false;
  bool isLoggedin = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey[800],
      body: Stack(
        children: <Widget>[
          Image.asset(
            'images/cats/back.jpg',
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          Container(
            color: Colors.black.withOpacity(0.7),
            width: double.infinity,
            height: double.infinity,
          ),
          SafeArea(
            child: Container(
              alignment: Alignment.topCenter,
              child: Image.asset(
                'images/cats/blah.png',
                width: 300,
                height: 200,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 250.0),
            child: Center(
              child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Material(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white.withOpacity(0.5),
                          elevation: 0,
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: TextFormField(
                              controller: _nameTextController,
                              decoration: InputDecoration(
                                hintText: "Name",
                                icon: Icon(
                                  Icons.person_outlined,
                                  color: Colors.black.withOpacity(1),
                                ),
                              ),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return "the Name field cannot be empty";
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                      ),

                      //*?Email text field
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Material(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white.withOpacity(0.5),
                          elevation: 0,
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: TextFormField(
                              controller: _emailTextController,
                              decoration: InputDecoration(
                                hintText: "Email",
                                icon: Icon(
                                  Icons.alternate_email_sharp,
                                  color: Colors.black,
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
                      //*?password textfield
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Material(
                          borderRadius: BorderRadius.circular(10),
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
                                  color: Colors.black.withOpacity(1),
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
                      ),
                      //*?confirm password textField
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Material(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white.withOpacity(0.5),
                          elevation: 0,
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Expanded(
                              child: TextFormField(
                                controller: _confirmTextController,
                                decoration: InputDecoration(
                                  hintText: "Confirm Password",
                                  icon: Icon(
                                    Icons.lock_outline_rounded,
                                    color: Colors.black.withOpacity(1),
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
                        ),
                      ),

                      //*?resgister button
                      Padding(
                        padding: EdgeInsets.all(8),
                        child: Material(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.blue[900].withOpacity(0.8),
                            elevation: 0,
                            child: MaterialButton(
                              onPressed: () {
                                //handlesignin();
                              },
                              minWidth: MediaQuery.of(context).size.width,
                              child: Text(
                                "Regiter",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                            )),
                      ),
                      Padding(
                          padding: EdgeInsets.all(8),
                          child: InkWell(
                            onTap: () {
                              Navigator.pop(
                                context,
                              );
                            },
                            child: Text(
                              "Login",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.red[900], fontSize: 17),
                            ),
                          ))
                    ],
                  )),
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
    );
  }
}
