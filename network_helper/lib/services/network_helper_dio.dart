import 'package:dio/dio.dart';

class NetworkHelperDio {
  final String url;
  final String token;
  // NetworkHelperDio 생성시 기본url과 항상 헤더에 담길 token을 입력받는다
  NetworkHelperDio(this.url, this.token);

  // 기본 설정
  Dio _dio() {
    return Dio(BaseOptions(
      connectTimeout: 10000,
      receiveTimeout: 10000,
      headers: {'Authorization':'Bearer $token'}
      )
    );
  }

  // GET
  Future get(String subUrl) async {
    Response response = await _dio().get(url + subUrl);
    if(response.statusCode ==200) {
      return response;
    } else {
      print(response.statusCode);
    }
  }

  // POST with data
  Future post(String subUrl, Map<String, dynamic> data) async {
    Response response = await _dio().post(url + subUrl, data: data);
    if(response.statusCode ==200) {
      return response;
    } else {
      print(response.statusCode);
    }
  }

  // POST with formdata
  Future postForm(String subUrl, FormData formData) async {
    Response response = await _dio().post(url + subUrl, data: formData);
    if(response.statusCode ==200) {
      return response;
    } else {
      print(response.statusCode);
    }
  }

  // PATCH
  Future patch(String subUrl, Map<String, dynamic> data) async {
    Response response = await _dio().patch(url + subUrl, data: data);
    if(response.statusCode ==200) {
      return response;
    } else {
      print(response.statusCode);
    }
  }

  // DELETE
  Future delete(String subUrl, Map<String, dynamic> data) async {
    Response response = await _dio().delete(url + subUrl, data: data);
    if(response.statusCode ==200) {
      return response;
    } else {
      print(response.statusCode);
    }
  }
}

