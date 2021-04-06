import 'package:flutter/material.dart';

class HorizontalListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Category(
            image_location: 'images/cats/formal.png',
            image_caption: "Formals",
          ),
          Category(
            image_location: 'images/cats/informal.png',
            image_caption: "Informals",
          ),
          Category(
            image_location: 'images/cats/dress.png',
            image_caption: "dress",
          ),
          Category(
            image_location: 'images/cats/jeans.png',
            image_caption: "jeans",
          ),
          Category(
            image_location: 'images/cats/tshirt.png',
            image_caption: "Tshirt",
          ),
          Category(
            image_location: 'images/cats/accessories.png',
            image_caption: "Accessories",
          ),
          Category(
            image_location: 'images/cats/shoe.png',
            image_caption: "Shoes",
          )
        ],
      ),
    );
  }
}

class Category extends StatelessWidget {
  final String image_location;
  final String image_caption;
  Category({this.image_location, this.image_caption});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(2),
      child: InkWell(
        onTap: () {},
        child: Container(
          width: 100,
          child: ListTile(
            title: Image.asset(
              image_location,
              width: 100,
              height: 80,
            ),
            subtitle: Container(
              alignment: Alignment.topCenter,
              child: Text(image_caption),
            ),
          ),
        ),
      ),
    );
  }
}
