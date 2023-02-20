import 'dart:convert';
import 'dart:developer';
import 'package:dummy_store/models/product_model.dart';
import 'package:dio/dio.dart';

class ProductController {
  String baseUrl = 'https://fakestoreapi.com';
  final dio = Dio();

  Future<ProductList> getProductData() async {
    try {
      final response = await dio.get('$baseUrl/products');
      log(response.statusCode.toString());
      if (response.statusCode == 200) {
        log(response.data.toString());
        return ProductList.fromJson(response.data);
      } else {
        return Future.error('Something went wrong');
      }
    } on DioError catch (e) {
      log(e.response.toString());
      if (e.response == null) {
        return Future.error("Internet Not Connected");
      } else {
        return Future.error('Something went wrong');
      }
    } catch (e) {
      log(e.toString());
      return Future.error('Something went wrong');
    }
  }
}
