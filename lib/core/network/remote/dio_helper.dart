import 'dart:convert';

import 'package:dio/dio.dart';

// final dio = Dio();
class DioHelper{
  static Dio? dio;

  static init(){
    dio = Dio(
      BaseOptions(
        receiveDataWhenStatusError: true,
        headers: {
          'Content-Type': 'application/json',
        },
      ),
    );
  }

  static Future<Response> postData({
    required String url,
    Map<String, dynamic> query = const {},
    required Map<String, dynamic> data,
  }) async{
    return dio!.post(
      url,
      queryParameters: query,
      data: data,
    );
  }




}
