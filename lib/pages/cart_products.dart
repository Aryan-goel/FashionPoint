import 'package:flutter/material.dart';

class Cartproducts extends StatefulWidget {
  @override
  _CartproductsState createState() => _CartproductsState();
}

class _CartproductsState extends State<Cartproducts> {
  var Products_on_the_cart = [
    {
      "name": "Blazer men",
      "picture": "images/cats/products/blazer1.jpeg",
      "old_price": 250,
      "price": 150,
    },
    {
      "name": "Blazer women",
      "picture": "images/cats/products/blazer2.jpeg",
      "old_price": 310,
      "price": 240,
    },
    {
      "name": "Red dress",
      "picture": "images/cats/products/dress1.jpeg",
      "old_price": 200,
      "price": 140,
    },
    {
      "name": "Black dress",
      "picture": "images/cats/products/dress2.jpeg",
      "old_price": 280,
      "price": 200,
    },
    {
      "name": "Heels",
      "picture": "images/cats/products/hills1.jpeg",
      "old_price": 2100,
      "price": 1400,
    },
    {
      "name": "Heels",
      "picture": "images/cats/products/hills2.jpeg",
      "old_price": 2100,
      "price": 1400,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 3,
      itemBuilder: (context, index) {
        return Text("blah");
      },
    );
  }
}
