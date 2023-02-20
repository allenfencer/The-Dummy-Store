import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class CartItemModel {
  final int prodId;
  final num? price;
  final String productName;
  final String imageUrl;
  num quantity;
  final String? description;

  CartItemModel({
    required this.prodId,
    required this.price,
    required this.productName,
    required this.imageUrl,
    required this.description,
    this.quantity = 1,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'prodId': prodId,
      'price': price,
      'productName': productName,
      'imageUrl': imageUrl,
      'quantity': quantity,
      'description': description,
    };
  }

  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    return CartItemModel(
        prodId: json['prodId'],
        price: json['price'],
        productName: json['productName'],
        imageUrl: json['imageUrl'],
        description: json['description']);
  }
}
