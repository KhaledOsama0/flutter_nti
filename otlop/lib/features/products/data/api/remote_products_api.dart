import 'dart:developer';
import 'package:dio/dio.dart';
class RemoteProductApi {
 final dio = Dio();
Future  getProducts() async {
    List products = [];
    try {
      final response = await dio.get(
        'https://talabat639.runasp.net/api/Products',
      );
      products = response.data['data'];
      return products;
    } on DioException catch (e) {
      log(e.toString());
    }
  }
Future getCategories() async {
    List categories = [];
    try {
      final response = await dio.get(
        'https://talabat639.runasp.net/api/Products/categories',
      );
      categories = response.data;
      return categories;
    } on DioException catch (e) {
      log(e.toString());
    }
  }
Future getBrands() async {
    List brands = [];
    try {
      final response = await dio.get(
        'https://talabat639.runasp.net/api/Products/brands',
      );
      brands = response.data;
      return brands;
    } on Exception catch (e) {
      log(e.toString());
      throw Exception (e);
    }
  }
Future getProductsByCategory(int id) async {
    List products = [];
    try {
      final response = await dio.get(
        'https://talabat639.runasp.net/api/Products',
        queryParameters: {'categoryId': id}
      );
      products = response.data['data'];
      return products;
    } on DioException catch (e) {
      log(e.toString());
    }
  }
  Future getProductsByBrand(int id) async {
    List brands = [];
    try {
      final response = await dio.get(
        'https://talabat639.runasp.net/api/Products',
        queryParameters: {'brandId': id}
      );
      brands = response.data['data'];
      return brands;
    } on DioException catch (e) {
      log(e.toString());
    }
  }
}
