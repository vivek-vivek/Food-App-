import 'dart:developer';

import 'package:assignment_test_for_the_zartek/model/home_model.dart';
import 'package:assignment_test_for_the_zartek/provider/home_provider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeApiServices {
  Future getDishDetailes(context) async {
    final home = Provider.of<HomeProvider>(context, listen: false);
    home.setLoading(true);
    final dio = Dio();

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          log('Request: ${options.method} ${options.uri}');
          log('Headers: ${options.headers}');
          log('Data: ${options.data}');
          return handler.next(options);
        },
        onResponse: (response, handler) async {
          log('Response: ${response.statusCode} ${response.requestOptions.uri}');
          log('Headers: ${response.headers}');
          // log('Data: ${response.data}');
          return handler.next(response);
        },
        onError: (error, handler) async {
          log('Error: ${error.message}');
          log('Stack trace: ${error.stackTrace}');
          return handler.next(error);
        },
      ),
    );

    Response response =
        await dio.get('https://www.mocky.io/v2/5dfccffc310000efc8d2c1ad');
    log(response.data.toString());
    if (response.statusCode == 200) {
      Provider.of<HomeProvider>(context, listen: false)
          .addResponse(response.data);
    } else {
      const CircularProgressIndicator();
    }
    home.setLoading(false);
  }
}
