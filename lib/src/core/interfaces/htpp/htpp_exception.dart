import 'package:paipfood_package/paipfood_package.dart';
import 'package:paipfood_package/src/core/interfaces/htpp/http_response.dart';

class HttpExeption implements Exception {
  String? message;
  int? statusCode;
  dynamic error;
  HttpResponse response;

  HttpExeption({
    required this.error,
    required this.response,
    this.message,
    this.statusCode,
  });

  @override
  String toString() {
    toast.showError("message");
    return 'RestClientException(message: $message, statusCode: $statusCode, error: $error, response: $response)';
  }
}
