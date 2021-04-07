import 'package:fashion_point/components/products.dart';
import 'package:fashion_point/main.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  final Product_detail_name;
  final Product_detail_newPrice;
  final Product_detail_oldprice;
  final Product_detail_picture;
  ProductDetails(
      {this.Product_detail_name,
      this.Product_detail_newPrice,
      this.Product_detail_oldprice,
      this.Product_detail_picture});

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(icon: Icon(Icons.search), onPressed: () {}),
          ],
          elevation: 20,
          backgroundColor: Colors.red[800],
          title: InkWell(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Home()));
            },
            child: Text(
              "Fashion Point",
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
        body: ListView(children: [
          Container(
            height: 300,
            child: GridTile(
              child: Container(
                color: Colors.white70,
                child: Image.asset(
                  widget.Product_detail_picture,
                ),
              ),
              footer: Container(
                color: Colors.white,
                child: ListTile(
                  leading: Text(
                    widget.Product_detail_name,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  title: Row(
                    children: [
                      Expanded(
                          child: Text(
                        "\$${widget.Product_detail_oldprice}",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey[500],
                            decoration: TextDecoration.lineThrough),
                      )),
                      Expanded(
                          child: Text(
                        "\$${widget.Product_detail_newPrice}",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.red[800]),
                      )),
                    ],
                  ),
                ),
              ),
            ),
          ),

//*?     =======The first button=======

          Row(
            children: <Widget>[
//*?     =======Size button=========
              Expanded(
                child: MaterialButton(
                  elevation: 8,
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("Size"),
                            content: Text("choose the size"),
                            actions: [
                              MaterialButton(
                                onPressed: () {
                                  Navigator.of(context).pop(context);
                                },
                                child: Text("Close"),
                              )
                            ],
                          );
                        });
                  },
                  color: Colors.white70,
                  textColor: Colors.black,
                  child: Row(
                    children: <Widget>[
                      Expanded(child: Text("Size")),
                      Expanded(child: Icon(Icons.arrow_drop_down))
                    ],
                  ),
                ),
              ),
              //*?     =======Color button=========
              Expanded(
                child: MaterialButton(
                  elevation: 8,
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("Size"),
                            content: Text("choose the Color"),
                            actions: [
                              MaterialButton(
                                onPressed: () {
                                  Navigator.of(context).pop(context);
                                },
                                child: Text("Close"),
                              )
                            ],
                          );
                        });
                  },
                  color: Colors.white70,
                  textColor: Colors.black,
                  child: Row(
                    children: <Widget>[
                      Expanded(child: Text("Color")),
                      Expanded(child: Icon(Icons.arrow_drop_down))
                    ],
                  ),
                ),
              ),
              //*?     =======Quantity button=========
              Expanded(
                child: MaterialButton(
                  elevation: 8,
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("Size"),
                            content: Text("choose the quantity "),
                            actions: [
                              MaterialButton(
                                onPressed: () {
                                  Navigator.of(context).pop(context);
                                },
                                child: Text("Close"),
                              )
                            ],
                          );
                        });
                  },
                  color: Colors.white70,
                  textColor: Colors.black,
                  child: Row(
                    children: <Widget>[
                      Expanded(child: Text("Qty")),
                      Expanded(child: Icon(Icons.arrow_drop_down))
                    ],
                  ),
                ),
              )
            ],
          ),

//*?   =========Second button========

          Row(
            children: [
              Expanded(
                  child: MaterialButton(
                elevation: 5,
                onPressed: () {},
                color: Colors.red[600],
                textColor: Colors.white,
                child: Text("Buy Now"),
              )),
              IconButton(
                  icon: Icon(Icons.add_shopping_cart_sharp), onPressed: () {}),
              IconButton(
                icon: Icon(Icons.favorite),
                onPressed: () {},
                color: Colors.red[700],
              )
            ],
          ),
          Divider(
            //height: 13,
            thickness: 1,
            color: Colors.black,
          ),
          ListTile(
            title: Text("product details"),
            subtitle: Text(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
          ),
          Divider(
            thickness: 1,
          ),
          Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(12, 5, 5, 5),
                child: Text(
                  "Product Name",
                  style: TextStyle(color: Colors.black),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: Text(widget.Product_detail_name),
              )
            ],
          ),
          Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(12, 5, 5, 5),
                child: Text(
                  "Product brand",
                  style: TextStyle(color: Colors.black),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: Text("Brand"),
              )
            ],
          ),

          //*! add product condition!*//
          Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(12, 5, 5, 5),
                child: Text(
                  "Product Condition",
                  style: TextStyle(color: Colors.black),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: Text("NEW"),
              )
            ],
          ),

          //*?similar products selection
          Container(
            height: 360,
            child: SimilarProducts(),
          )
        ]));
  }
}

class SimilarProducts extends StatefulWidget {
  @override
  _SimilarProductsState createState() => _SimilarProductsState();
}

class _SimilarProductsState extends State<SimilarProducts> {
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
      "name": "Black dress",
      "picture": "images/cats/products/dress2.jpeg",
      "old_price": 280,
      "price": 200,
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
      "name": "Shoes",
      "picture": "images/cats/products/shoe1.jpg",
      "old_price": 100,
      "price": 40,
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
        return Similar_Single_Prod(
          product_name: product_list[index]["name"],
          product_picture: product_list[index]["picture"],
          product_oldPrice: product_list[index]["old_price"],
          product_price: product_list[index]["price"],
        );
      },
    );
  }
}

class Similar_Single_Prod extends StatelessWidget {
  final product_name;
  final product_picture;
  final product_oldPrice;
  final product_price;
  Similar_Single_Prod(
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
