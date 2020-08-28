import 'package:flutter/material.dart';
import 'package:flutter_auth/main.dart';
import 'package:flutter_auth/pages/cart.dart';
import 'package:flutter_auth/components/cart_products.dart';
import 'package:provider/provider.dart';


class ProductDetails extends StatefulWidget {
  final product_detail_name;
  final product_detail_new_price;
  final product_detail_old_price;
  final product_detail_picture;

  ProductDetails({
    this.product_detail_name,
    this.product_detail_new_price,
    this.product_detail_old_price,
    this.product_detail_picture,
  });

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: new AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          title: (
             InkWell(
              onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> new HomePage()));},
              child: Text('AppStore',
              ))
          ),
          actions: <Widget>[
            new IconButton(icon: Icon(Icons.search, color:Colors.white,), onPressed: (){}),
            new IconButton(icon: Icon(Icons.shopping_cart, color:Colors.white,), onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> Cart()));},)
          ],
        ),

      body: new ListView(
        children: <Widget>[
         new Container(
           height: 300.0,
           child: GridTile(
               child: Container(
                 color: Colors.white,
                 child: Image.asset(widget.product_detail_picture),
               ),
               footer: new Container(
                 color: Colors.white70,
                 child: ListTile(
                   leading:  new Text(widget.product_detail_name,
                   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),),
                   title:  new Row(
                     children: <Widget>[
                        Expanded(
                         child: new Text("\$${widget.product_detail_old_price}",
                         style: TextStyle(color: Colors.grey, decoration: TextDecoration.lineThrough),),
                   ),
                       Expanded(
                         child: new Text("\$${widget.product_detail_new_price}", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 16.0),),
                       )
               ],
           ),
           ),
         ),
    ),
      ),

//      ========= The first button ==========

      Row(
        children: <Widget>[

//       ========= the size button =======
          Expanded(
            child: MaterialButton(
              onPressed: (){
    showDialog(context: context,
    builder: (context){
      return new AlertDialog(
        title: new Text("Size"),
        content: new Text("Choose the size"),
        actions: <Widget>[
          new MaterialButton(onPressed: (){
            Navigator.of(context).pop(context);
          },
          child: new Text("close"),)
        ],
      );
    });
              },
              color: Colors.white,
              textColor: Colors.grey,
              elevation: 0.2,
              child: Row(
                children: <Widget>[
                  Expanded(
                  child:  new Text("Size")
                  ),

                  Expanded(
                    child:  new Icon(Icons.arrow_drop_down),
                  ),
                ],
              ),
            ),
          ),

          //       ========= the size button =======
          Expanded(
            child: MaterialButton(
              onPressed: (){
                showDialog(context: context,
                    builder: (context){
                      return new AlertDialog(
                        title: new Text("Colors"),
                        content: new Text("Choose a Color",style: TextStyle(fontFamily: 'Raleway',fontWeight: FontWeight.w900,fontSize: 13,)),
                        actions: <Widget>[
                          new MaterialButton(onPressed: (){
                            Navigator.of(context).pop(context);
                          },
                            child: new Text("close"),)
                        ],
                      );
                    });
              },
              color: Colors.white,
              textColor: Colors.grey,
              elevation: 0.2,
              child: Row(
                children: <Widget>[
                  Expanded(
                      child:  new Text("Color")
                  ),

                  Expanded(
                    child:  new Icon(Icons.arrow_drop_down),
                  ),
                ],
              ),
            ),
          ),

          //       ========= the size button =======
          Expanded(
            child: MaterialButton(
              onPressed: (){
                showDialog(context: context,
                    builder: (context){
                      return new AlertDialog(
                        title: new Text("Quantity"),
                        content: new Text("Choose the Quantity"),
                        actions: <Widget>[
                          new MaterialButton(onPressed: (){
                            Navigator.of(context).pop(context);
                          },
                            child: new Text("close"),)
                        ],
                      );
                    });
              },
              color: Colors.white,
              textColor: Colors.grey,
              elevation: 0.2,
              child: Row(
                children: <Widget>[
                  Expanded(
                      child:  new Text("Qty")
                  ),

                  Expanded(
                    child:  new Icon(Icons.arrow_drop_down),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),


//      ========= The Second button ==========

          Row(
            children: <Widget>[

//       ========= the size button =======
              Expanded(
                child: MaterialButton(onPressed: (){

                },
                  color: Colors.red,
                  textColor: Colors.white,
                  elevation: 0.2,
                  child: new Text("Add to Cart"),
                ),
              ),

              new IconButton(icon: Icon(Icons.add_shopping_cart),color: Colors.red, onPressed: (){}),

              new IconButton(icon: Icon(Icons.favorite_border),color: Colors.red, onPressed: (){}),
            ],
          ),
          Divider(),
          new ListTile(
            title: new Text("Product details",style: TextStyle(fontFamily: 'Raleway',fontWeight: FontWeight.w900,fontSize: 20,)),
            subtitle: new Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset"),
          ),
          Divider(),
          new Row(
            children: <Widget>[
              Padding(padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
              child: new Text("Product name", style: TextStyle(fontFamily: 'Raleway',fontWeight: FontWeight.w900,fontSize: 15,),),),
              Padding(padding: EdgeInsets.all(5.0),
              child: new Text(widget.product_detail_name),)
            ],
          ),

          new Row(
            children: <Widget>[
              Padding(padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: new Text("Product brand", style: TextStyle(fontFamily: 'Raleway',fontWeight: FontWeight.w900,fontSize: 15,)),),
              // product brand
              Padding(padding: EdgeInsets.all(5.0),
                child: new Text("Brand X"),)
            ],
          ),


// product condition
          new Row(
            children: <Widget>[
              Padding(padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: new Text("Product condition", style: TextStyle(fontFamily: 'Raleway',fontWeight: FontWeight.w900,fontSize: 15,)),),
              Padding(padding: EdgeInsets.all(5.0),
                child: new Text("NEW"),)
            ],
          ),

          Divider(),
          Padding(padding: const EdgeInsets.all(8.0),
          child: new Text("Similar products"),
          ),

          // Similar product section
          Container(
            height: 360.0,
            child: Similar_products(),
          )
        ],
      ),
    );
  }
}

class Similar_products extends StatefulWidget {
  @override
  _Similar_productsState createState() => _Similar_productsState();
}

class _Similar_productsState extends State<Similar_products> {

  var product_list = [
    {
      "name": "Shirts",
      "picture": "images/products/blazer1.jpeg",
      "old_price": 120,
      "price": 85,
    },
    {
      "name": "tshirts",
      "picture": "images/products/blazer2.jpeg",
      "old_price": 120,
      "price": 85,
    },
    {
      "name": "Black Dress",
      "picture": "images/products/dress2.jpeg",
      "old_price": 120,
      "price": 85,
    },
    {
      "name": "Red dress",
      "picture": "images/products/dress1.jpeg",
      "old_price": 100,
      "price": 50,
    },
    {
      "name": "Heels",
      "picture": "images/products/hills1.jpeg",
      "old_price": 120,
      "price": 85,
    },
    {
      "name": "jeans",
      "picture": "images/products/pants2.jpeg",
      "old_price": 120,
      "price": 85,
    },
    {
      "name": "Shoes",
      "picture": "images/products/shoe1.jpg",
      "old_price": 120,
      "price": 85,
    },
    {
      "name": "Short skirts",
      "picture": "images/products/skt2.jpeg",
      "old_price": 120,
      "price": 85,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: product_list.length,
        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return Similar_Single_prod(
            prod_name: product_list[index]['name'],
            prod_picture: product_list[index]['picture'],
            prod_old_price: product_list[index]['old_price'],
            prod_price: product_list[index]['price'],
          );
        });
  }
}

class Similar_Single_prod extends StatelessWidget {
  final prod_name;
  final prod_picture;
  final prod_old_price;
  final prod_price;

  Similar_Single_prod({
    this.prod_name,
    this.prod_picture,
    this.prod_old_price,
    this.prod_price,
  });
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(tag: prod_name, child: Material(
        child: InkWell(onTap: ()=> Navigator.of(context).push( new MaterialPageRoute(builder:(context) => new ProductDetails(
          //here we are passing the values of the product to the product details page
          product_detail_name: prod_name,
          product_detail_new_price: prod_price,
          product_detail_old_price: prod_old_price,
          product_detail_picture: prod_picture,
        ))),
          child: GridTile(
              footer: Container(color: Colors.white70,
                child: ListTile(
                  leading: Text(prod_name, style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  title: Text("\$$prod_price", style: TextStyle(color: Colors.red, fontWeight: FontWeight.w800),
                  ),
                  subtitle:  Text("\$$prod_old_price", style: TextStyle(color: Colors.black54, fontWeight: FontWeight.w800, decoration:TextDecoration.lineThrough,
                  ),
                  ),

                ),
              ),
              child: Image.asset(prod_picture,
                fit: BoxFit.cover,)),
        ),
      )),
    );
  }
}




