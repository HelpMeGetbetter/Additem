import 'dart:ui';

import 'package:flutter/material.dart';

class HorizontalList extends StatefulWidget {
  @override
  _HorizontalListState createState() => _HorizontalListState();
}

class _HorizontalListState extends State<HorizontalList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Cateogory(
            image_location: 'cats/tshirt.png',
            image_caption: 'Shirt',
          ),

          Cateogory(
            image_location: 'cats/dress.png',
            image_caption: 'Dress',
          ),

          Cateogory(
            image_location: 'cats/jeans.png',
            image_caption: 'Pants',
          ),

          Cateogory(
            image_location: 'cats/formal.png',
            image_caption: 'Formal',
          ),

      Cateogory(
        image_location: 'cats/informal.png',
        image_caption: 'Informal',
      ),
        ],
      ),
    );
  }
}

class Cateogory extends StatelessWidget {
  final String image_location;
  final String image_caption;

  Cateogory({
    this.image_location,
    this.image_caption
});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.all(2.0),
      child: InkWell(onTap: (){},
       child: Container(
          width: 100.0,
          child: ListTile(
        title: Image.asset(image_location,
        width: 100.0,
        height: 80.0,
        ),
        subtitle: Container(
          alignment: Alignment.topCenter,
          child: Text(image_caption, style: TextStyle(fontFamily: 'Raleway',fontWeight: FontWeight.w900,fontSize: 14,)),
          ),
       ),
      ),
      ),
    );
 }
}

