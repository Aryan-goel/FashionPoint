import 'package:fashion_point/components/horizontalListView.dart';
import 'package:fashion_point/components/products.dart';

import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

void main() => runApp(MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
    ));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    Widget imagecarousel = Container(
      height: 200,
      child: Carousel(
        boxFit: BoxFit.cover,
        images: [
          AssetImage('images/c1.jpg'),
          AssetImage('images/cats/m1.jpeg'),
          AssetImage('images/cats/w3.jpeg'),
          AssetImage('images/cats/w4.jpeg'),
          AssetImage('images/m2.jpg'),
        ],
        autoplay: false,
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: Duration(milliseconds: 2000),
        dotSize: 5,
        dotColor: Colors.black,
        indicatorBgPadding: 6,
      ),
    );
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
          IconButton(icon: Icon(Icons.shopping_cart_outlined), onPressed: () {})
        ],
        elevation: 20,
        backgroundColor: Colors.red[800],
        title: Text(
          "Fashion Point",
          style: TextStyle(fontSize: 20),
        ),
        //centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(
                "Aryan Goel",
                style: TextStyle(fontSize: 24),
              ),
              accountEmail: Text("aryan.goel002@gmail.com",
                  style: TextStyle(fontSize: 18)),
              currentAccountPicture: GestureDetector(
                child: CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Icon(Icons.person_outline_outlined),
                  foregroundColor: Colors.black,
                ),
              ),
              decoration: BoxDecoration(color: Colors.red[800]),
            ),
            InkWell(
              //*? inkwell widget is used to convert any widget to a button
              onTap: () {},
              child: ListTile(
                title: Text("Home", style: TextStyle(fontSize: 15)),
                leading: Icon(
                  Icons.home,
                  color: Colors.black,
                ),
              ),
            ),
            InkWell(
              //*? inkwell widget is used to convert any widget to a button
              onTap: () {},
              child: ListTile(
                  title: Text("My Account", style: TextStyle(fontSize: 15)),
                  leading: Icon(
                    Icons.person,
                    color: Colors.black,
                  )),
            ),
            InkWell(
              //*? inkwell widget is used to convert any widget to a button
              onTap: () {},
              child: ListTile(
                  title: Text("My Orders", style: TextStyle(fontSize: 15)),
                  leading: Icon(
                    Icons.shopping_basket,
                    color: Colors.black,
                  )),
            ),
            InkWell(
              //*? inkwell widget is used to convert any widget to a button
              onTap: () {},
              child: ListTile(
                title: Text("Cart", style: TextStyle(fontSize: 15)),
                leading: Icon(
                  Icons.shopping_cart_outlined,
                  color: Colors.black,
                ),
              ),
            ),
            InkWell(
              //*? inkwell widget is used to convert any widget to a button
              onTap: () {},
              child: ListTile(
                title: Text("Favourites", style: TextStyle(fontSize: 15)),
                leading: Icon(
                  Icons.favorite_outlined,
                  color: Colors.black,
                ),
              ),
            ),
            Divider(
              thickness: 2,
            ),
            InkWell(
              //*? inkwell widget is used to convert any widget to a button
              onTap: () {},
              child: ListTile(
                title: Text("Settings", style: TextStyle(fontSize: 15)),
                leading: Icon(
                  Icons.settings,
                  color: Colors.black,
                ),
              ),
            ),
            InkWell(
              //*? inkwell widget is used to convert any widget to a button
              onTap: () {},
              child: ListTile(
                  title: Text("About", style: TextStyle(fontSize: 15)),
                  leading: Icon(
                    Icons.help,
                    color: Colors.black,
                  )),
            ),
          ],
        ),
      ),
      body: ListView(children: <Widget>[
        imagecarousel,
        Padding(
          padding: EdgeInsets.all(10),
          child: Text("Categories"),
        ),

        //*! categories horizontal view
        HorizontalListView(),
        Padding(
          padding: EdgeInsets.all(10),
          child: Text("Recent Products"),
        ),

        //*! grid View of the recent elements
        Container(
          height: 320,
          child: Products(),
        )
      ]),
    );
  }
}
