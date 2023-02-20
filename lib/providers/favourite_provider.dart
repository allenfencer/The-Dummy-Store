import 'package:dummy_store/models/product_model.dart';
import 'package:flutter/material.dart';

class FavouriteProvider with ChangeNotifier {
  List<ProductModel> favList = [];
  bool isFavourited = false;

  addItemToFavourites(ProductModel item) {
    favList.add(item);
    notifyListeners();
  }

  removeItemFromFavourites(ProductModel item) {
    favList.remove(item);
    notifyListeners();
  }
}
