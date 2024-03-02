import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:paipfood_package/paipfood_package.dart';
import 'package:http/http.dart' as h;

class HttpWeb implements IHttp {
  final bool autoToast;
  final log = Log(printer: PrettyPrinter());

  String _baseUrl = '';
  Map<String, String> _headers = {};

  Map<String, String> _convertMap(Map map) {
    return Map.from(map.map((key, value) => MapEntry(key, value.toString())));
  }

  Map<String, String>? _headersBuilder(Map? headers) {
    final Map<String, String> hd = {};
    // ignore: cascade_invocations
    hd
      ..addAll(_headers)
      ..addAll(_convertMap(headers ?? {}));
    if (hd == {}) return null;
    return hd;
  }

  String _convertQueryParam(Map<String, dynamic>? map) {
    String result = '';
    if (map == null) return result;
    map.forEach((key, value) {
      if (result.isNotEmpty) result += '&';
      result += '$key=$value';
    });
    return result;
  }

  HttpWeb({BaseOptions? baseOptions, this.autoToast = false}) {
    baseOptions ??= _defaultOptions;
    if (_baseUrl.isEmpty) _baseUrl = baseOptions.baseUrl;
    _headers = _convertMap(baseOptions.headers);
  }

  final _defaultOptions = BaseOptions(
    baseUrl: Env.supaBaseUrl,
    headers: {
      "apiKey": Env.supaApiKey,
      "Content-Type": "application/json",
      "Prefer": "return=representation",
    },
  );

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
      final uri = Uri.parse("$_baseUrl$path${_convertQueryParam(query)}");
      _logInfo(uri.toString(), "DELETE", queryParamters: query, headers: headers, data: data);

      final DateTime start = DateTime.now();
      final response = await h.delete(
        uri,
        body: data,
        headers: _headersBuilder(headers),
      );
      final DateTime end = DateTime.now();
      _logResponse(path, "DELETE", response: response, time: end.difference(start).inMilliseconds.toString());
      return _dioResponseConverter(response);
    } on DioException catch (e) {
      _trowRestClientException(e);
    }
  }

  @override
  Future<HttpResponse<T>> get<T>(String path, {Map<String, dynamic>? query, Map<String, dynamic>? headers}) async {
    try {
      final uri = Uri.parse("$_baseUrl$path${_convertQueryParam(query)}");
      _logInfo(uri.toString(), "GET", queryParamters: query, headers: headers, baseOptions: _headers);

      final DateTime start = DateTime.now();
      final response = await h.get(
        uri,
        headers: _headersBuilder(headers),
      );
      final DateTime end = DateTime.now();
      _logResponse(path, "GET", response: response, time: end.difference(start).inMilliseconds.toString());
      return _dioResponseConverter(response);
    } on DioException catch (e) {
      _trowRestClientException(e);
    }
  }

  @override
  Future<HttpResponse<T>> patch<T>(String path, {data, Map<String, dynamic>? query, Map<String, dynamic>? headers}) async {
    try {
      final uri = Uri.parse("$_baseUrl$path${_convertQueryParam(query)}");
      _logInfo(uri.toString(), "PATCH", queryParamters: query, headers: headers, baseOptions: _headers);

      final DateTime start = DateTime.now();
      final response = await h.patch(
        uri,
        body: data,
        headers: _headersBuilder(headers),
      );
      final DateTime end = DateTime.now();
      _logResponse(path, "PATCH", response: response, time: end.difference(start).inMilliseconds.toString());
      return _dioResponseConverter(response);
    } on DioException catch (e) {
      _trowRestClientException(e);
    }
  }

  @override
  Future<HttpResponse<T>> post<T>(String path, {data, Map<String, dynamic>? query, Map<String, dynamic>? headers}) async {
    try {
      final uri = Uri.parse("$_baseUrl$path${_convertQueryParam(query)}");
      _logInfo(uri.toString(), "POST", queryParamters: query, headers: headers, baseOptions: _headers);

      final DateTime start = DateTime.now();
      final response = await h.post(
        uri,
        body: data,
        headers: _headersBuilder(headers),
      );
      final DateTime end = DateTime.now();
      _logResponse(path, "POST", response: response, time: end.difference(start).inMilliseconds.toString());
      return _dioResponseConverter(response);
    } on DioException catch (e) {
      _trowRestClientException(e);
    }
  }

  @override
  Future<HttpResponse<T>> put<T>(String path, {data, Map<String, dynamic>? query, Map<String, dynamic>? headers}) async {
    try {
      final uri = Uri.parse("$_baseUrl$path${_convertQueryParam(query)}");
      _logInfo(uri.toString(), "PUT", queryParamters: query, headers: headers, baseOptions: _headers);

      final DateTime start = DateTime.now();
      final response = await h.put(
        uri,
        body: data,
        headers: _headersBuilder(headers),
      );
      final DateTime end = DateTime.now();
      _logResponse(uri.toString(), "PUT", response: response, time: end.difference(start).inMilliseconds.toString());
      return _dioResponseConverter(response);
    } on DioException catch (e) {
      _trowRestClientException(e);
    }
  }

  @override
  Future<HttpResponse<T>> request<T>(String path, {data, Map<String, dynamic>? query, Map<String, dynamic>? headers}) async {
    try {
      final uri = Uri.parse("$_baseUrl$path${_convertQueryParam(query)}");
      _logInfo(uri.toString(), "REQUEST", queryParamters: query, headers: headers, baseOptions: _headers);

      final DateTime start = DateTime.now();
      final response = await h.patch(
        uri,
        body: data,
        headers: _headersBuilder(headers),
      );
      final DateTime end = DateTime.now();
      _logResponse(path, "REQUEST", response: response, time: end.difference(start).inMilliseconds.toString());
      return _dioResponseConverter(response);
    } on DioException catch (e) {
      return _trowRestClientException(e);
    }
  }

  Future<HttpResponse<T>> _dioResponseConverter<T>(h.Response response) async {
    final res = HttpResponse<T>(
      data: jsonDecode(response.body),
      statusCode: response.statusCode,
      statusMessage: response.reasonPhrase,
    );
    if (response.statusCode >= 300) {
      final resOp = RequestOptions(
        data: res.data,
      );
      _trowRestClientException(DioException(
          requestOptions: resOp,
          error: res.data,
          response: Response(requestOptions: resOp, data: res.data, statusCode: res.statusCode, statusMessage: res.statusMessage)));
    }
    return res;
  }

  String getErrorMessage(DioException dioError) {
    if (dioError.response?.data['error_description'] != null) {
      return dioError.response?.data['error_description'];
    }
    if (dioError.response?.data['error'] != null) {
      return dioError.response?.data['error'];
    }
    if (dioError.response?.data['message'] != null) {
      return dioError.response?.data['message'];
    }
    if (dioError.response?.data['msg'] == null) {
      return dioError.response?.data['message'];
    }
    return dioError.response?.data['msg'];
  }

  Never _trowRestClientException(DioException dioError) {
    final exception = HttpExceptionCustom(
      error: dioError.error,
      message: getErrorMessage(dioError),
      response: dioError.response,
      requestOptions: dioError.requestOptions,
      stackTrace: dioError.stackTrace,
      type: dioError.type,
      msg: getErrorMessage(dioError),
    );
    _logError(
        error: exception.error.toString(),
        stackTrace: exception.stackTrace,
        message: exception.msg ?? exception.message,
        statusCode: exception.response?.statusCode.toString());
    throw Exception(exception.message ?? exception);
  }

  void _logInfo(String path, String methodo,
      {Map<String, dynamic>? headers, Map<String, dynamic>? baseOptions, Map<String, dynamic>? queryParamters, dynamic data}) {
    log.i(
        'METHOD: $methodo \nPATH: $path \nQUERYPARAMTERS: $queryParamters \nHEADERS: $headers \nBASEOPTIONS: $baseOptions \nDATA: ${data is Uint8List ? 'bytes' : data}');
  }

  void _logError({String? error, String? message, String? statusCode, StackTrace? stackTrace}) {
    log
      ..wtf('ERROR: $error \nMESSAGE: $message \nSTATUSCODE: $statusCode')
      ..w('STACKTRACE: $stackTrace');
  }

  void _logResponse(String path, String methodo, {h.Response? response, String? time}) {
    if (response?.statusCode == 200) {
      log.d('[RESPONSE]: ${response?.statusCode}\nMETHOD: $methodo \nPATH: $autoToast \nTIME: 🕑$time ms \nRESPONSE: ${response?.body}');
    } else {
      log.wtf('[RESPONSE]: ${response?.statusCode}\nMETHOD: $methodo \nPATH: $path \nTIME: 🕑$time ms \nRESPONSE: ${response?.body}');
    }
  }
}
