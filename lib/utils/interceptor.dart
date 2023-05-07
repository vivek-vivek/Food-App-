/*
final dio = Dio(
      BaseOptions(
        baseUrl: 'https://www.mocky.io/v2',
        connectTimeout: const Duration(seconds: 5000),
        receiveTimeout: const Duration(seconds: 3000),
      ),
    );

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
          log('Data: ${response.data}');
          return handler.next(response);
        },
        onError: (error, handler) async {
          log('Error: ${error.message}');
          log('Stack trace: ${error.stackTrace}');
          return handler.next(error);
        },
      ),
    );
*/