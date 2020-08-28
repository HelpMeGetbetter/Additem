
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Cart_products extends StatefulWidget {
  final sum;

  const Cart_products({Key key,  this.sum}) : super(key: key);
  @override
  _Cart_productsState createState() => _Cart_productsState();
}

class _Cart_productsState extends State<Cart_products> {
  var Products_on_the_cart = [
    {
      "name": "Shirts",
      "picture": "images/products/blazer1.jpeg",
      "old_price": 120,
      "price": 85,
      "size": "X",
      "color": "Deep Blue",
    },
    {
      "name": "tshirts",
      "picture": "images/products/blazer2.jpeg",
      "old_price": 110,
      "price": 75,
      "size": "X",
      "color": "Blue",
    },
    {
      "name": "Black Dress",
      "picture": "images/products/dress2.jpeg",
      "old_price": 95,
      "price": 55,
      "size": "X",
      "color": "Black",
    },
    {
      "name": "Red dress",
      "picture": "images/products/dress1.jpeg",
      "old_price": 100,
      "price": 50,
      "size": "X",
      "color": "Red",
    },
    {
      "name": "Heels",
      "picture": "images/products/hills1.jpeg",
      "old_price": 145,
      "price": 85,
      "size": "X",
      "color": "Mergenta",
    },
    {
      "name": "Hills",
      "picture": "images/products/hills2.jpeg",
      "old_price": 75,
      "price": 45,
      "size": "X",
      "color": "Red",
    },
    {
      "name": "Pants",
      "picture": "images/products/pants1.jpg",
      "old_price": 85,
      "price": 60,
      "size": "X",
      "color": "Grey",
    },
    {
      "name": "jeans",
      "picture": "images/products/pants2.jpeg",
      "old_price": 90,
      "price": 70,
      "size": "X",
      "color": "Blue",
    },
    {
      "name": "Shoes",
      "picture": "images/products/shoe1.jpg",
      "old_price": 125,
      "price": 100,
      "size": "X",
      "color": "White",
    },
    {
      "name": "Long skirts",
      "picture": "images/products/skt1.jpeg",
      "old_price": 130,
      "price": 85,
      "size": "X",
      "color": "Unknown",
    },
    {
      "name": "Short skirts",
      "picture": "images/products/skt2.jpeg",
      "old_price": 115,
      "price": 75,
      "size": "X",
      "color": "Pink",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: Products_on_the_cart.length,
      itemBuilder: (context, index){
        return Single_cart_product(
          cart_product_name: Products_on_the_cart[index]["name"],
          cart_product_color: Products_on_the_cart[index]["color"],
          cart_product_qty: Products_on_the_cart[index]["quantity"],
          cart_product_size: Products_on_the_cart[index]["size"],
          cart_product_price: Products_on_the_cart[index]["price"],
          cart_product_picture: Products_on_the_cart[index]["picture"],
          cart_product_oldprice: Products_on_the_cart[index]["old_price"],
        );
      });
  }
}

class Single_cart_product extends StatelessWidget {
  final cart_product_name;
  final cart_product_size;
  final cart_product_color;
  final cart_product_qty;
  final cart_product_price;
  final cart_product_picture;
  final cart_product_oldprice;


  Single_cart_product({
    this.cart_product_name,
    this.cart_product_size,
    this.cart_product_color,
    this.cart_product_price,
    this.cart_product_qty,
    this.cart_product_picture,
    this.cart_product_oldprice,
});


  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading:  new Image.asset(cart_product_picture),
        title: new Text(cart_product_name,),
        subtitle: new Column(
          children: <Widget>[
           // Row inside column
            new Row(
              children: <Widget>[
                // this section is for the size of the product
                Expanded(child: new Text("size",),),
               Padding(
                   padding: const EdgeInsets.all(6.0),
               child: new Text("$cart_product_size",style: TextStyle(fontFamily: 'Raleway',fontWeight: FontWeight.w900,fontSize: 17,)),
               ),
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: new Text('l', style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold), ),
                ),
          ],
        ),
            new Container(child: new Text("$cart_product_color"),
            ),
            //
            new Container(
              alignment: Alignment.topLeft,
              child:  new Text("\$$cart_product_price", style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15, color: Colors.red),),
            ),
            new Container(
              alignment: Alignment.topLeft,
              child:  new Text("\$$cart_product_oldprice", style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15, color: Colors.black38,decoration: TextDecoration.lineThrough),),
            ),

    ],
      ),
        trailing: new Column(
          children: <Widget>[
            new IconButton(icon: Icon(Icons.arrow_drop_down), onPressed: (){}),
          ],
        ),
      ),
    );
  }
}
class cart with ChangeNotifier {
Map<String, Single_cart_product> _items = {};

Map<String, Single_cart_product> get items {
  return {..._items};
}

int get itemCount {
  return _items.length;
}

void addItem(String pdtid, String name, double price) {
  if (_items.containsKey(pdtid)) {
    _items.update(
        pdtid,
            (existingCartItem) => Single_cart_product(
            cart_product_name: existingCartItem.cart_product_name,
            cart_product_qty: existingCartItem.cart_product_qty + 1,
            cart_product_price: existingCartItem.cart_product_price));
  } else {
    _items.putIfAbsent(
        pdtid,
            () => Single_cart_product(
          cart_product_name: name,
          cart_product_qty: 1,
          cart_product_price: price,
        ));
  }
  notifyListeners();
}

void removeItem(String id) {
  _items.remove(id);
  notifyListeners();
}

void removeSingleItem(String id) {
  if (!_items.containsKey(id)) {
    return;
  }
  if (_items[id].cart_product_qty > 1) {
    _items.update(
        id,
            (existingCartItem) => Single_cart_product(
          cart_product_name: existingCartItem.cart_product_name ,
          cart_product_qty: existingCartItem.cart_product_qty - 1,
          cart_product_price: existingCartItem.cart_product_price,));
  }
  notifyListeners();
}

double get totalAmount {
  var total = 0.0;
  _items.forEach((key, cartItem) {
    total += cartItem.cart_product_price * cartItem.cart_product_qty;
  });
  return total;
}

void clear() {
  _items = {};
  notifyListeners();
}
}

