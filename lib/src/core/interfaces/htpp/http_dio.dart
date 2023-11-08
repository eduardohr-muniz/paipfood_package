import 'package:flutter/foundation.dart';
import 'package:paipfood_package/paipfood_package.dart';
import 'http_exception.dart';
import 'http_response.dart';
import 'i_http.dart';

class HttpDio implements IHttp {
  late final Dio _dio;
  final bool autoToast;
  final log = Log(printer: PrettyPrinter());

  HttpDio({BaseOptions? baseOptions, this.autoToast = true}) {
    if (baseOptions != null) _dio = Dio(baseOptions);
    _dio = Dio();
  }

  final _defaultOptions = BaseOptions();

  @override
  IHttp auth() {
    _defaultOptions.extra["auth_required"] = true;
    return this;
  }

  @override
  IHttp unauth() {
    _defaultOptions.extra["auth_required"] = false;
    return this;
  }

  @override
  Future<HttpResponse<T>> delete<T>(String path, {data, Map<String, dynamic>? query, Map<String, dynamic>? headers}) async {
    try {
      _logInfo(path, "DELETE", queryParamters: query, headers: headers);
      final response = await _dio.delete(
        path,
        data: data,
        queryParameters: query,
        options: Options(headers: headers),
      );

      return _dioResponseConverter(response);
    } on DioException catch (e) {
      if (autoToast) {
        _trowToast(e);
        return HttpResponse();
      } else {
        _trowRestClientException(e);
      }
    }
  }

  @override
  Future<HttpResponse<T>> get<T>(String path, {Map<String, dynamic>? query, Map<String, dynamic>? headers}) async {
    try {
      _logInfo(path, "GET", queryParamters: query, headers: headers);
      final DateTime start = DateTime.now();
      final response = await _dio.get(
        path,
        queryParameters: query,
        options: Options(headers: headers),
      );
      final DateTime end = DateTime.now();
      _logResponse(path, "GET", response: response, time: end.difference(start).inMilliseconds.toString());
      return _dioResponseConverter(response);
    } on DioException catch (e) {
      if (autoToast) {
        _trowToast(e);
        return HttpResponse();
      } else {
        _trowRestClientException(e);
      }
    }
  }

  @override
  Future<HttpResponse<T>> patch<T>(String path, {data, Map<String, dynamic>? query, Map<String, dynamic>? headers}) async {
    try {
      _logInfo(path, "PATCH", queryParamters: query, headers: headers);
      final response = await _dio.patch(
        path,
        data: data,
        queryParameters: query,
        options: Options(headers: headers),
      );
      return _dioResponseConverter(response);
    } on DioException catch (e) {
      if (autoToast) {
        _trowToast(e);
        return HttpResponse();
      } else {
        _trowRestClientException(e);
      }
    }
  }

  @override
  Future<HttpResponse<T>> post<T>(String path, {data, Map<String, dynamic>? query, Map<String, dynamic>? headers}) async {
    try {
      _logInfo(path, "POST", queryParamters: query, headers: headers);
      final response = await _dio.post(
        path,
        data: data,
        queryParameters: query,
        options: Options(headers: headers),
      );
      return _dioResponseConverter(response);
    } on DioException catch (e) {
      if (autoToast) {
        _trowToast(e);
        return HttpResponse();
      } else {
        _trowRestClientException(e);
      }
    }
  }

  @override
  Future<HttpResponse<T>> put<T>(String path, {data, Map<String, dynamic>? query, Map<String, dynamic>? headers}) async {
    try {
      _logInfo(path, "PUT", queryParamters: query, headers: headers);
      final response = await _dio.put(
        path,
        data: data,
        queryParameters: query,
        options: Options(headers: headers),
      );
      return _dioResponseConverter(response);
    } on DioException catch (e) {
      if (autoToast) {
        _trowToast(e);
        return HttpResponse();
      } else {
        _trowRestClientException(e);
      }
    }
  }

  @override
  Future<HttpResponse<T>> request<T>(String path, {data, Map<String, dynamic>? query, Map<String, dynamic>? headers}) async {
    try {
      _logInfo(path, "REQUEST", queryParamters: query, headers: headers);
      final response = await _dio.patch(
        path,
        data: data,
        queryParameters: query,
        options: Options(headers: headers),
      );
      return _dioResponseConverter(response);
    } on DioException catch (e) {
      if (autoToast) {
        _trowToast(e);
        return HttpResponse();
      } else {
        _trowRestClientException(e);
      }
    }
  }

  Future<HttpResponse<T>> _dioResponseConverter<T>(Response<dynamic> response) async {
    return HttpResponse<T>(
      data: response.data,
      statusCode: response.statusCode,
      statusMessage: response.statusMessage,
    );
  }

  void _trowToast(DioException dioError) {
    final response = dioError.response;
    String message = "";
    _logError(
      error: dioError.error.toString(),
      message: response?.statusMessage,
      statusCode: response?.statusCode.toString(),
      stackTrace: dioError.stackTrace,
    );

    if (response?.statusCode != null) {
      message = ServerException.exeptionEquals(response!.statusCode!) ?? dioError.error.toString();
    } else {
      message = dioError.error.toString();
    }
    toast.showError(message);
  }

  Never _trowRestClientException(DioException dioError) {
    final response = dioError.response;

    final exception = HttpExceptionCustom(
      error: dioError.error,
      message: response?.statusMessage,
      statusCode: response?.statusCode,
      response: HttpResponse(
        data: response?.data,
        statusCode: response?.statusCode,
        statusMessage: response?.statusMessage,
      ),
    );
    throw exception;
  }

  void _logInfo(String path, String methodo, {Map<String, dynamic>? headers, Map<String, dynamic>? queryParamters, dynamic data}) {
    log.i('METHOD: $methodo \nPATH: ${_dio.options.baseUrl}$path \nQUERYPARAMTERS: $queryParamters \nHEADERS: $headers \nDATA: $data');
  }

  void _logError({String? error, String? message, String? statusCode, StackTrace? stackTrace}) {
    log
      ..wtf('ERROR: $error \nMESSAGE: $message \nSTATUSCODE: $statusCode')
      ..w('STACKTRACE: ${stackTrace.toString()}');
  }

  void _logResponse(String path, String methodo, {Response? response, String? time}) {
    if (response?.statusCode == 200) {
      log.d(
          '[RESPONSE]: ${response?.statusCode}\nMETHOD: $methodo \nPATH: ${_dio.options.baseUrl}$path \nTIME: 🕑$time ms \nRESPONSE: ${response?.data}');
    } else {
      log.wtf(
          '[RESPONSE]: ${response?.statusCode}\nMETHOD: $methodo \nPATH: ${_dio.options.baseUrl}$path \nTIME: 🕑$time ms \nRESPONSE: ${response?.data}');
    }
  }
}