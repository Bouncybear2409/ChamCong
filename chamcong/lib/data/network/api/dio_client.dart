// ignore_for_file: type_annotate_public_apis
import 'package:chamcong/data/network/api/dio_exception.dart';
import 'package:curl_logger_dio_interceptor/curl_logger_dio_interceptor.dart';
import 'package:dio/dio.dart';

class Api {
  final tokenDio = Dio(BaseOptions(baseUrl: "http://192.168.22.10:8000/"));
  String? userToken;
  String? userRefreshToken;
  bool isRememberMe = false;
  bool isLogged = false;

  factory Api() => _singleton;

  Api._internal();

  static final _singleton = Api._internal();

  static Dio _createDio({
    Options? customOptions,
    bool hasToken = false,
    bool isAutoLogout = true,
  }) {
    final dio = Dio(
      BaseOptions(
        // baseUrl: "http://192.168.22.10:8000/",
        receiveTimeout: const Duration(seconds: 15), // 15 seconds
        connectTimeout: const Duration(seconds: 15),
        sendTimeout: const Duration(seconds: 15),
      ),
    );

    dio.interceptors.addAll({
      AppInterceptors(
        dio,
        customOptions: customOptions,
        hasToken: hasToken,
      ),
      CurlLoggerDioInterceptor(
        printOnSuccess: true,
      ),
    });
    return dio;
  }

  // ignore: use_setters_to_change_properties
  void setHeaderToken({String? token, String? refreshToken}) {
    userToken = token;
    userRefreshToken = refreshToken;
    isLogged = token != null;
  }

  // ignore: use_setters_to_change_properties, avoid_positional_boolean_parameters
  void setRememberMe(bool value) {
    isRememberMe = value;
  }

  // Get:-----------------------------------------------------------------------
  Future<Response> get(
    String url, {
    Map<String, dynamic>? queryParameters,
    Options? customOptions,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
    bool hasToken = false,
    bool isAutoLogout = true,
  }) async {
    try {
      final Response response = await _createDio(
        customOptions: customOptions,
        hasToken: hasToken,
        isAutoLogout: isAutoLogout,
      ).get(
        url,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // Post:----------------------------------------------------------------------
  Future<Response> post(
    String url, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? customOptions,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
    bool hasToken = false,
    bool isAutoLogout = true,
  }) async {
    try {
      final Response response = await _createDio(
        customOptions: customOptions,
        hasToken: hasToken,
        isAutoLogout: isAutoLogout,
      ).post(
        url,
        data: data,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // Put:-----------------------------------------------------------------------
  Future<Response> put(
    String url, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? customOptions,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
    bool hasToken = false,
    bool isAutoLogout = true,
  }) async {
    try {
      final Response response = await _createDio(
        customOptions: customOptions,
        hasToken: hasToken,
        isAutoLogout: isAutoLogout,
      ).put(
        url,
        data: data,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // Patch:-----------------------------------------------------------------------
  Future<Response> patch(
    String url, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? customOptions,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
    bool hasToken = false,
    bool isAutoLogout = true,
  }) async {
    try {
      final Response response = await _createDio(
        customOptions: customOptions,
        hasToken: hasToken,
        isAutoLogout: isAutoLogout,
      ).patch(
        url,
        data: data,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // Delete:--------------------------------------------------------------------
  Future<Response> delete(
    String url, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? customOptions,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
    bool hasToken = false,
    bool isAutoLogout = true,
  }) async {
    try {
      final Response response = await _createDio(
        customOptions: customOptions,
        hasToken: hasToken,
        isAutoLogout: isAutoLogout,
      ).delete(
        url,
        data: data,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
