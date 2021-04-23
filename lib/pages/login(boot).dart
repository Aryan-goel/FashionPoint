import 'dart:convert';

import 'package:fashion_point/pages/signup(boot).dart';
import 'package:fashion_point/pages/user.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

class Login2 extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login2> {
  final _formKey = GlobalKey<FormState>();
  User user = User("", "");
  Future save() async {
    //String url = "http://localhost:8080/login";
    var res = await http.post("http://localhost:8080/login",
        headers: {"Content-Type": "application/json"},
        body: json.encode({"email": user.email, "password": user.password}));
    print(res.body);
  }

  // TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passswordTextController = TextEditingController();
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
            color: Colors.black.withOpacity(0.6),
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

          //*?email text field
          Padding(
            padding: const EdgeInsets.only(top: 150.0),
            child: Center(
              child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
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
                                  controller:
                                      TextEditingController(text: user.email),
                                  onChanged: (val) {
                                    user.email = val;
                                  },
                                  decoration: InputDecoration(
                                      hintText: "Email",
                                      icon: Icon(
                                        Icons.alternate_email_sharp,
                                        color: Colors.black,
                                      ),
                                      border: InputBorder.none),
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return "email is empty";
                                    } else {
                                      return null;
                                    }
                                  }),
                            ),
                          ),
                        ),
                        //*?password textfield
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Material(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white.withOpacity(0.6),
                            elevation: 0,
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: TextFormField(
                                controller:
                                    TextEditingController(text: user.password),
                                onChanged: (val) {
                                  user.password = val;
                                },
                                obscureText: true,
                                decoration: InputDecoration(
                                    hintText: "Password",
                                    icon: Icon(
                                      Icons.lock_outline_rounded,
                                      color: Colors.black.withOpacity(1),
                                    ),
                                    border: InputBorder.none),
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

                        //*?========Login button========
                        Padding(
                          padding: EdgeInsets.all(8),
                          child: Material(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.blue[700].withOpacity(1),
                              elevation: 0,
                              child: MaterialButton(
                                onPressed: () {
                                  save();
                                },
                                minWidth: MediaQuery.of(context).size.width,
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              )),
                        ),
                        Divider(
                          color: Colors.black.withOpacity(0.7),
                          thickness: 1.8,
                        ),
                        Text(
                          "Other login in options",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            //fontWeight: FontWeight.bold
                          ),
                        ),
                        //?google sign in button
                        Padding(
                          padding: EdgeInsets.all(8),
                          child: Material(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.red[900].withOpacity(0.8),
                              elevation: 0,
                              child: MaterialButton(
                                onPressed: () {
                                  //handleSignIn();
                                },
                                minWidth: MediaQuery.of(context).size.width,
                                child: Text(
                                  "Google",
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
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Signup2()));
                              },
                              child: Text(
                                "sign up",
                                style: TextStyle(
                                    color: Colors.red[900], fontSize: 17),
                              ),
                            ))
                      ],
                    ),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
