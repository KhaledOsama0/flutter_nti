import 'dart:developer';

import 'package:dio/dio.dart';

class RemoteAuthApi {
  final Dio dio = Dio();
  Future<void> login({required String email, required String password}) async {
    try {
      await dio.post(
        'https://talabat639.runasp.net/api/Account/Login',
        data: {"email": email, "password": password},
      );
      log("Success");
    } on DioException catch (e) {
      log('Register failed: ${e.response?.data ?? 'Error'}');
    }
  }

  Future<void> register({
    required String email,
    required String password,
    required String name,
    required String phone,
  }) async {
    try {
      await dio.post(
        'https://talabat639.runasp.net/api/Account/Register',
        data: {
          "email": email,
          "password": password,
          'displayName': name,
          'phoneNumber': phone,
        },
      );
      log("Success");
    } on DioException catch (e) {
      log('Register failed: ${e.response?.data ?? 'Error'}');
    }
  }

}
