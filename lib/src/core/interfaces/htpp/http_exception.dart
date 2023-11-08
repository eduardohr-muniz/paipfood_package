import 'package:paipfood_package/src/core/interfaces/htpp/http_response.dart';
import 'package:paipfood_package/src/core/provider/toast_provider.dart';
import '../../exceptions/exception.dart';

class HttpExceptionCustom implements Exception {
  String? message;
  int? statusCode;
  dynamic error;
  HttpResponse response;

  HttpExceptionCustom({
    required this.error,
    required this.response,
    this.message,
    this.statusCode,
  });

  @override
  String toString() {
    final String defaul = '⚠️ERROR: \n$error';
    if (statusCode != null) {
      final String? httpMessage = ServerException.exeptionEquals(statusCode!);
      if (httpMessage != null) {
        return httpMessage;
      } else {
        return defaul;
      }
    }
    return defaul;
  }
}