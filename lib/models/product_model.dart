import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class ProductList {
  List<ProductModel> productList;
  ProductList({
    required this.productList,
  });

  factory ProductList.fromJson(List<dynamic> json){
    return ProductList(productList: json.map((e) => ProductModel.fromJson(e)).toList());
  }
}

// List<ProductModel> productListModel(String str) {
//   return List<ProductModel>.from(
//       jsonDecode(str).map((e) => ProductModel.fromJson(e)));
// }

class ProductModel {
  final int id;
  final String title;
  final num price;
  final String category;
  final String description;
  final String imageUrl;
  final ProductRating productRating;
  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.category,
    required this.description,
    required this.imageUrl,
    required this.productRating,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
        id: json['id'],
        title: json['title'],
        price: json['price'] ,
        category: json['category'],
        description: json['description'],
        imageUrl: json['image'],
        productRating: ProductRating.fromJson(json['rating']));
  }
}

class ProductRating {
  final num rating;
  final int count;
  ProductRating({
    required this.rating,
    required this.count,
  });

  factory ProductRating.fromJson(Map<String, dynamic> json) {
    return ProductRating(rating: json['rate'], count: json['count']);
  }
}
