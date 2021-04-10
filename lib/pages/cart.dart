import 'package:fashion_point/pages/cart_products.dart';
import 'package:flutter/material.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      appBar: AppBar(
        actions: [
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
        ],
        elevation: 0,
        backgroundColor: Colors.red[800],
        title: Text(
          "Cart",
          style: TextStyle(fontSize: 20),
        ),
        //centerTitle: true,
      ),
      body: Cartproducts(),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Row(
          children: [
            Expanded(
                child: ListTile(
              title: Text(
                "Total:",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text("\$230"),
            )),
            Expanded(
                child: MaterialButton(
              onPressed: () {},
              child: Text(
                "Check out",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              color: Colors.red[700],
            ))
          ],
        ),
      ),
    );
  }
}
