import 'package:dio/dio.dart';

class HttpService {
  Dio _dio;

  HttpService()
      : _dio = Dio(
            BaseOptions(baseUrl: "http://188.225.44.128:3000/restaurants/get"));

  Future<Response> getRequest(String endPoint) async {
    Response response;
    response = await _dio.get(endPoint);
    try {
      response = await _dio.get(endPoint);
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    }
    return response;
  }

  intializeInterceptors() {
    _dio.interceptors.add(InterceptorsWrapper(
      onError: (error, errorInterceptorHandler) {
        print(error.message);
      },
      onRequest: (request, requestInterceptorHandler) {
        print("${request.method} ${request.path}");
      },
      onResponse: (response, responseInterceptorHandler) {
        print(response.data);
      },
    ));
  }
}
