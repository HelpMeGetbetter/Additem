import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/widgets.dart';

//my own imports
import 'package:flutter_auth/components/horizontal_listview.dart';
import 'package:flutter_auth/components/products.dart';
import 'package:flutter_auth/login_Signup/Screens/Welcome/welcome_screen.dart';
import 'package:flutter_auth/pages/cart.dart';
import 'package:flutter_auth/login_Signup/main.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'Model/Data.dart';







void main(){
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    )
  );
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Future<List<Data>> getAllData() async{


    var api="https://jsonplaceholder.typicode.com/photos";
    var data=await http.get(api);

    var jsonData=json.decode(data.body);

    List<Data>listOf=[];
    
    for(var i in jsonData) {
      Data data=new Data(i ["id"], i["title"], i["url"], i["thumbnailUrl"]);
      listOf.add(data);

    }
    return listOf;

  }
  @override
  Widget build(BuildContext context) {
    Widget image_carousel = new Container(
      height: 200.0,
      child: new Carousel(
        boxFit: BoxFit.cover,
        images: [
          AssetImage('images/c1.jpg'),
          AssetImage('images/m1.jpeg'),
          AssetImage('images/w1.jpeg'),
          AssetImage('images/w4.jpeg'),
          AssetImage('images/w3.jpeg'),
          AssetImage('images/m2.jpg'),
        ],
        autoplay: true,
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: Duration(milliseconds: 1000),
        indicatorBgPadding: 6.0,
      ),
    );

    return Scaffold(
      appBar: new AppBar(
        centerTitle: false,
        backgroundColor: Colors.transparent,
        title: Text('AppStore',
        style: TextStyle(fontFamily: 'Raleway')),
        actions: <Widget>[
          new IconButton(icon: Icon(Icons.search, color:Colors.white,), onPressed: (){})
          ,new IconButton(icon: Icon(Icons.shopping_cart, color:Colors.white,), onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> new Cart()));
          })
        ],
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
//            header
          new UserAccountsDrawerHeader(accountName: Text('Santos Emoque'), accountEmail: Text('santosenoque.ss@gmail.com'),
          currentAccountPicture: GestureDetector(
            child: CircleAvatar(
              backgroundColor: Colors.grey,
              child: Icon(Icons.person, color: Colors.white,),
            ),
          ),
            decoration: new BoxDecoration(
              color: Colors.red
            ),
          ),

//          body

          InkWell(
            onTap: (){},
            child: ListTile(
              title: Text('Home Page'),
              leading: Icon(Icons.home, color: Colors.red,)
            ),
          ),

            InkWell(
              onTap: (){Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return WelcomeScreen();
                  },
                ),
              );},
              child: ListTile(
                title: Text('LogOut'),
                leading: Icon(Icons.person, color: Colors.red),
             ),
           ),

            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('My Orders'),
                leading: Icon(Icons.shopping_basket, color: Colors.red),
              ),
            ),
            
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> new Cart()));
              },
              child: ListTile(
                title: Text('Shopping Cart'),
                leading: Icon(Icons.shopping_cart, color: Colors.red),
              ),
            ),
            
            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('Favourites'),
                leading: Icon(Icons.favorite, color: Colors.red),
              ),
            ),

            Divider(),

            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('Settings'),
                leading: Icon(Icons.settings)
              ),
            ),

            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('About'),
                leading: Icon(Icons.help,),
              ),
            ),
            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('More info'),
                leading: Icon(Icons.info,),
              ),
            )

          ],
        ),
      ),

      body: new ListView(
        children: <Widget>[

        //image carousel begins here
          image_carousel,

          //Padding widget
          new Padding(padding: const EdgeInsets.all(8.0),
            child: new Text('Categories',
              style: TextStyle(fontFamily: 'DancingScript',fontWeight: FontWeight.w900,fontSize: 25,),
            textAlign: TextAlign.center,),),

          //Horizontal list view begins here
          HorizontalList(),

          //Padding widget
          new Padding(padding: const EdgeInsets.all(17.0),
            child: new Text('Recent products',
            style: TextStyle(fontFamily: 'DancingScript',fontSize: 25,fontWeight: FontWeight.w900),
            textAlign: TextAlign.center,),
          ),

//grid view
        Container(
          height: 320.0,
          child: Products(),
        )
        ],
      ),
    );
  }
}





