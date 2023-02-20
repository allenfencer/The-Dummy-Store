import 'package:dummy_store/models/cart_model.dart';
import 'package:flutter/material.dart';

class CartProvider with ChangeNotifier {
  List<CartItemModel> cartItems = [];

  addItemToCart(CartItemModel item) {
    cartItems.add(item);
    notifyListeners();
  }

  removeItemFromCart(CartItemModel item) {
    cartItems.remove(item);
    notifyListeners();
  }

  incrementItemCount(CartItemModel item) {
    item.quantity++;
    notifyListeners();
  }

  decrementItemCount(CartItemModel item) {
    item.quantity <= 1 ? 0 : item.quantity--;
    notifyListeners();
  }
}
