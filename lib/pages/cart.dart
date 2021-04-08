import 'package:flutter/material.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
        ],
        elevation: 20,
        backgroundColor: Colors.red[800],
        title: Text(
          "Cart",
          style: TextStyle(fontSize: 20),
        ),
        //centerTitle: true,
      ),
    );
  }
}
