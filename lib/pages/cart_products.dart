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
      "price": 150,
      "size": "L",
      "color": "black",
      "quantity": 1
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: Products_on_the_cart.length,
        itemBuilder: (context, index) {
          return SingleCartProduct(
            cart_product_name: Products_on_the_cart[index]["name"],
            cart_product_color: Products_on_the_cart[index]["color"],
            cart_product_qty: Products_on_the_cart[index]["qty"],
            cart_product_size: Products_on_the_cart[index]["size"],
            cart_product_picture: Products_on_the_cart[index]["picture"],
            cart_product_price: Products_on_the_cart[index]["price"],
          );
          //cart_product_picture: Products_on_the_cart[index]["picture"]);
        });
  }
}

class SingleCartProduct extends StatelessWidget {
  final cart_product_name;
  final cart_product_picture;
  final cart_product_price;
  final cart_product_size;
  final cart_product_color;
  final cart_product_qty;
  SingleCartProduct(
      {this.cart_product_name,
      this.cart_product_picture,
      this.cart_product_price,
      this.cart_product_size,
      this.cart_product_color,
      this.cart_product_qty});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          cart_product_name,
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        subtitle: Column(
          children: [
            Row(
              children: [
                //*?this section is fotr the size of the product
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Text(
                    "size:",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Text(cart_product_size,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black)),
                ),
                Padding(padding: EdgeInsets.fromLTRB(20, 8, 8, 8)),

                //*? this section is for the color of the product
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Text("Color:",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black)),
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Text(cart_product_color,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
