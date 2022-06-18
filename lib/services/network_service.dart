import 'package:flutter/cupertino.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:cookie_jar/cookie_jar.dart';

import '../constants.dart';
import '../utils/common.dart';

class NetworkService {
  static final Dio dio = _init();

  static Dio _init() {
    var dio = Dio(BaseOptions(
        connectTimeout: 10000, // in ms
        receiveTimeout: 10000,
        sendTimeout: 10000,
        responseType: ResponseType.plain,
        followRedirects: false,
        validateStatus: (status) {
          return true;
        })); // some dio configurations

    dio.interceptors.add(CookieManager(CookieJar()));

    return dio;
  }

  static Future getData(String url) async {
    if (isWeb) {
      url = webmodeUrl + '/get?path=' + Uri.encodeComponent(url);
    }
    debugPrint('getData: url=$url');

    Response response = await dio.get(url);
    // debugPrint('getData: '+ response.headers.toString());
    debugPrint('response.statusCode=${response.statusCode}');

    if (response.statusCode == 200) {
      return response;
    } else {
      debugPrint('getData: response.statusCode=${response.statusCode}');
      debugPrint('getData: response=$response');
      throw Exception('statusCode error[$response.statusCode]');
    }
  }

  static Future get(String url, Map<String, dynamic>? queryParameters) async {
    debugPrint('getData: url=$url');
    debugPrint('getData: queryParameters=$queryParameters');

    if (isWeb) {
      if (queryParameters != null) {
        queryParameters['path'] = Uri.encodeComponent(url);
      }
      url = webmodeUrl + '/get';

      debugPrint('getData:web: url=$url');
      debugPrint('getData:web: queryParameters=$queryParameters');
    }

    Response response = await dio.get(url, queryParameters: queryParameters);
    // debugPrint('getData: '+ response.headers.toString());
    debugPrint('response.statusCode=${response.statusCode}');

    if (response.statusCode == 200) {
      return response;
    } else {
      debugPrint('getData: response.statusCode=${response.statusCode}');
      debugPrint('getData: response=$response');
      throw Exception('statusCode error[$response.statusCode]');
    }
  }

  static Future post(String url, Map<String, dynamic>? queryParameters) async {
    debugPrint('postData: url=$url');
    debugPrint('postData: queryParameters=$queryParameters');

    if (isWeb) {
      if (queryParameters != null) {
        queryParameters['path'] = Uri.encodeComponent(url);
      }
      url = webmodeUrl + '/post';

      debugPrint('postData:web: url=$url');
      debugPrint('postData:web: queryParameters=$queryParameters');
    }

    Response response = await dio.post(url, queryParameters: queryParameters);
    // debugPrint(response.headers.toString());
    //debugPrint("response=$response");
    debugPrint('response.statusCode=${response.statusCode}');

    if (response.statusCode == 200) {
      return response;
    } else if (response.statusCode == 302) {
      var url2 = response.headers['location'];

      if (url2 != null && url2[0] != null) {
        return getData(url2[0]);
      } else {
        debugPrint('postData: url2 is null');
        throw Exception('url2 is null');
      }
    } else {
      debugPrint('postData: response.statusCode=${response.statusCode}');
      debugPrint('postData: response=$response');
      throw Exception('statusCode error[$response.statusCode]');
    }
  }
}
