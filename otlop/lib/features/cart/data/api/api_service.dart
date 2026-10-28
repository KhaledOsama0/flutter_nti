import 'dart:developer';

import 'package:dio/dio.dart';

class ApiService {
  final Dio dio = Dio();
  Future addToCart({required int id, required int quantity}) async {
    try {
      final response = await dio.post(
        'https://talabat639.runasp.net/api/Basket',
        data: {"productId": id, "quantity": quantity},
        options: Options(
          headers: {
            'Authorization':
                'Bearer eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9naXZlbm5hbWUiOiJLdWxIUnF3TjBWIiwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvZW1haWxhZGRyZXNzIjoiS3VsSFJxd04wVkBURG1Fd2pwLmp3eSIsImh0dHA6Ly9zY2hlbWFzLnhtbHNvYXAub3JnL3dzLzIwMDUvMDUvaWRlbnRpdHkvY2xhaW1zL25hbWVpZGVudGlmaWVyIjoiZmNlNTE2NjctM2UzNC00NWM2LWExZjMtZjMwMWQ5NzhjZDk4IiwiZXhwIjoxNzkzMjc2OTI3LCJpc3MiOiJodHRwczovL2xvY2FsaG9zdDo3MjY0IiwiYXVkIjoiTXlTZWN1cmVkQVBJVXNlcnMifQ.Ee8JsnB-lp4fM5R0YLzzQek2piVgW2Z-1s8l-Fpj2IY',
          },
        ),
      );
      log('Added to cart ${response.data}');
    } on DioException catch (e) {
      log(e.response?.data.toString() ?? 'Error adding to cart');
    }
  }

  Future getCart() async {
    try {
      final response = await dio.get(
        'https://talabat639.runasp.net/api/Basket',
      );
      log('Cart ${response.data}');
      return response.data;
    } on DioException catch (e) {
      log(e.response?.data.toString() ?? 'Error getting cart');
    }
  }
}
