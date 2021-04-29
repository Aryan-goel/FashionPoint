import 'package:fashion_point/pages/home.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fashion_point/databases/users.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  UserServices _userServices = UserServices();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passswordTextController = TextEditingController();
  TextEditingController _nameTextController = TextEditingController();
  TextEditingController _confirmTextController = TextEditingController();
  String gender;
  String groupvalue = "male";
  bool loading = false;
  bool hidePass = true;
//bool isLoggedin = false;
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
                width: 200,
                height: 150,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 200.0),
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
                                  border: InputBorder.none),
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
                                  border: InputBorder.none),
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
                            child: ListTile(
                              title: TextFormField(
                                controller: _passswordTextController,
                                obscureText: hidePass,
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
                                  } else if (_passswordTextController.text !=
                                      value) {
                                    return "the passwords do not match !";
                                  }
                                  return null;
                                },
                              ),
                              trailing: IconButton(
                                  icon: Icon(Icons.remove_red_eye),
                                  onPressed: () {
                                    setState(() {
                                      hidePass = false;
                                    });
                                  }),
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
                              child: ListTile(
                                title: TextFormField(
                                  controller: _confirmTextController,
                                  obscureText: hidePass,
                                  decoration: InputDecoration(
                                      hintText: "Confirm Password",
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
                                trailing: IconButton(
                                    icon: Icon(Icons.remove_red_eye),
                                    onPressed: () {
                                      setState(() {
                                        hidePass = false;
                                      });
                                    }),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          color: Colors.white.withOpacity(0.5),
                          child: Row(
                            children: [
                              Expanded(
                                child: ListTile(
                                  title: Text(
                                    "Male",
                                    textAlign: TextAlign.end,
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  trailing: Radio(
                                      value: "male",
                                      groupValue: groupvalue,
                                      onChanged: (e) => valueChanged(e)),
                                ),
                              ),
                              Expanded(
                                child: ListTile(
                                  title: Text(
                                    "Female",
                                    textAlign: TextAlign.end,
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  trailing: Radio(
                                      value: "female",
                                      groupValue: groupvalue,
                                      onChanged: (e) => valueChanged(e)),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),

//*?resgister button
                      Padding(
                        padding: EdgeInsets.all(8),
                        child: Material(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.red[900].withOpacity(0.8),
                            elevation: 0,
                            child: MaterialButton(
                              onPressed: () async {
                                validateForm();
                              },
                              minWidth: MediaQuery.of(context).size.width,
                              child: Text(
                                "SignUp",
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
                                  color: Colors.blue[900], fontSize: 17),
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

  valueChanged(e) {
    setState(() {
      if (e == "male") {
        groupvalue = e;
        gender = e;
      } else if (e == "female") {
        groupvalue = e;
        gender = e;
      }
    });
  }

  Future validateForm() async {
    FormState formstate = _formKey.currentState;

    if (formstate.validate()) {
      formstate.reset();
      User user = await firebaseAuth.currentUser;
      if (user == null) {
        firebaseAuth
            .createUserWithEmailAndPassword(
                email: _emailTextController.text,
                password: _passswordTextController.text)
            .then((user) => {
                  _userServices.createUser(user.user.uid, {
                    "username": user.user.displayName,
                    "email": user.user.email,
                    "uderId": user.user.uid,
                    "gender": gender,
                  })
                })
            .catchError((error) => {print((error.toString()))});
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Home()));
      }
    }
  }
}
