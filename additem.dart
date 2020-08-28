import 'package:flutter/foundation.dart';
import 'package:flutter_auth/components/cart_products.dart';
import 'package:flutter_auth/components/products.dart';


class CartItem {
  final String id;
  final String name;
  final int quantity;
  final double price;

  CartItem(
      {@required this.id,
        @required this.name,
        @required this.quantity,
        @required this.price});
}

class Cart with ChangeNotifier {
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

