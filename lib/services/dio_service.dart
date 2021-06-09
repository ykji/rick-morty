import 'package:dio/dio.dart';
import 'package:rick_morty/utils/global.dart';

class DioService {
  Dio _dio;

  final baseUrl = "https://rickandmortyapi.com/api/";

  DioService() {
    _dio = Dio(BaseOptions(baseUrl: baseUrl));
    initializeInterceptors();
  }

  Future<Response> getRequest(String endPoint) async {
    Response response;
    response = await _dio.get(endPoint);
    return response;
  }

  initializeInterceptors() {
    _dio.interceptors.add(InterceptorsWrapper(
      onError: (error) {
        logger.e("inside interceptor " + error.message);
      },
      onRequest: (request) {
        logger.i("http request => ${request.method} ${request.path}");
      },
      onResponse: (response) {
        logger.d("Data has come.");
      },
    ));
  }
}
