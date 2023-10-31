// ignore_for_file: public_member_api_docs, sort_constructors_first

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

  void pushToast() {
    toast.error(error);
    if (statusCode != null) {
      final String? httpMessage = ServerException.exeptionEquals(statusCode!);
      if (httpMessage != null) {
        toast.error(httpMessage);
      } else {
        toast.error(error);
      }
    }
  }

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
