//import 'package:fashion_point/pages/home.dart';

//import 'package:firebase_core/firebase_core.dart';

import 'package:fashion_point/pages/login(boot).dart';
import 'package:fashion_point/pages/login.dart';
import 'package:flutter/material.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(MaterialApp(
    home: Login2(),
    debugShowCheckedModeBanner: false,
    theme: ThemeData(primaryColor: Colors.red[800]),
  ));
}
