import 'package:flutter/material.dart';

//my imports
import 'package:flutter_auth/components/cart_products.dart';
import 'package:flutter_auth/payments/main.dart';

class Cart extends StatefulWidget {


  @override
  _CartState createState() => _CartState();
}
class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text('Shopping Cart', style: TextStyle(fontFamily: 'Raleway',fontWeight: FontWeight.w900,color: Colors.red),),
        actions: <Widget>[
          new IconButton(icon: Icon(Icons.search, color:Colors.red,), onPressed: (){})
        ],
      ),

      body: new Cart_products(),

      bottomNavigationBar: new Container(
        color:  Colors.white,
        child: Row(
          children: <Widget>[
            Expanded(child: ListTile(
              title: new Text("Total:",style: TextStyle(fontFamily: 'Raleway',fontSize: 20.0,fontWeight: FontWeight.normal),),
              subtitle:  new Text("\$525",style: TextStyle(fontSize: 24.0,fontWeight: FontWeight.normal),),
            ),),
            
            Expanded(child: new MaterialButton(onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return MyApp();
                  },
                ),
              );
            },
            child:  new Text("Check out", style: TextStyle(color: Colors.white),),
            color: Colors.red,),
            ),
          ],
        ),
      ),
    );
  }
}
