import 'package:fashion_point/pages/product_details.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  var product_list = [
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
    {
      "name": "Pants",
      "picture": "images/cats/products/pants2.jpeg",
      "old_price": 2100,
      "price": 1400,
    },
    {
      "name": "pants",
      "picture": "images/cats/products/pants1.jpg",
      "old_price": 2100,
      "price": 1400,
    },
    {
      "name": "Shoes",
      "picture": "images/cats/products/shoe1.jpg",
      "old_price": 100,
      "price": 40,
    },
    {
      "name": "Skirt",
      "picture": "images/cats/products/skt1.jpeg",
      "old_price": 200,
      "price": 100,
    },
    {
      "name": "skirt",
      "picture": "images/cats/products/skt2.jpeg",
      "old_price": 210,
      "price": 140,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: product_list.length,
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (BuildContext context, int index) {
        return Single_Prod(
          product_name: product_list[index]["name"],
          product_picture: product_list[index]["picture"],
          product_oldPrice: product_list[index]["old_price"],
          product_price: product_list[index]["price"],
        );
      },
    );
  }
}

class Single_Prod extends StatelessWidget {
  final product_name;
  final product_picture;
  final product_oldPrice;
  final product_price;
  Single_Prod(
      {this.product_name,
      this.product_picture,
      this.product_oldPrice,
      this.product_price});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
          tag: product_name,
          child: Material(
            child: InkWell(
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ProductDetails(
                          //*?here we are passing details of the product
                          Product_detail_name: product_name,
                          Product_detail_picture: product_picture,
                          Product_detail_oldprice: product_oldPrice,
                          Product_detail_newPrice: product_price,
                        ))),
                //*?push is used to push a widget on top of another widget
                child: GridTile(
                    footer: Container(
                      color: Colors.white70,
                      child: ListTile(
                        leading: Text(
                          product_name,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        title: Text(
                          "\$$product_price",
                          style: TextStyle(
                              color: Colors.red[900],
                              fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          "\$$product_oldPrice",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.lineThrough),
                        ),
                      ),
                    ),
                    child: Image.asset(
                      product_picture,
                      fit: BoxFit.cover,
                    ))),
          )),
    );
  }
}
