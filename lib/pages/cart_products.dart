import 'package:flutter/material.dart';

class Cartproducts extends StatefulWidget {
  @override
  _CartproductsState createState() => _CartproductsState();
}

class _CartproductsState extends State<Cartproducts> {
  var Products_on_the_cart = [
    {
      "name": "Blazer",
      "picture": "images/cats/products/blazer1.jpeg",
      "price": 150,
      "size": "L",
      "color": "black",
      "quantity": 1
    },
    {
      "name": "Shoes",
      "picture": "images/cats/products/shoe1.jpg",
      "price": 15,
      "size": "8",
      "color": "Grey",
      "quantity": 2
    },
    {
      "name": "pants",
      "picture": "images/cats/products/pants1.jpg",
      "price": 25,
      "size": "34",
      "color": "Black",
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
            cart_product_qty: Products_on_the_cart[index]["quantity"],
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
      //elevation: 10,
      child: ListTile(
        //*?  ====== product picture=========?*//
        leading: Image.asset(
          cart_product_picture,
          height: 80,
          width: 80,
          fit: BoxFit.cover,
        ),

        //*? title Section
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
                  padding: EdgeInsets.all(4),
                  child: Text(
                    "size:",
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(4),
                  child: Text("$cart_product_size",
                      style: TextStyle(color: Colors.red[800], fontSize: 16)),
                ),
                Padding(padding: EdgeInsets.fromLTRB(20, 8, 8, 8)),

                //*? this section is for the color of the product
                Padding(
                  padding: EdgeInsets.all(4),
                  child: Text("Color:",
                      style: TextStyle(fontSize: 16, color: Colors.black)),
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Text(cart_product_color,
                      style: TextStyle(fontSize: 17, color: Colors.red[800])),
                ),
              ],
            ),
            Container(
                alignment: Alignment.topLeft,
                child: Text("\$${cart_product_price}",
                    style: TextStyle(
                        color: Colors.red[800],
                        fontSize: 17,
                        fontWeight: FontWeight.bold)))
          ],
        ),
        trailing: Column(
          children: [
            Expanded(
              child: IconButton(
                  alignment: Alignment.topCenter,
                  icon: Icon(Icons.arrow_drop_up),
                  onPressed: () {}),
            ),
            Padding(
                padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: Text("$cart_product_qty")),
            Expanded(
              child: IconButton(
                  //alignment: Alignment.topCenter,
                  icon: Icon(Icons.arrow_drop_down),
                  onPressed: () {}),
            )
          ],
        ),
      ),
    );
  }
}
