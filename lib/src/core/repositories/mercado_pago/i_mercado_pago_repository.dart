import 'package:paipfood_package/paipfood_package.dart';
import 'package:paipfood_package/src/core/models/order_invoice.dart';

abstract interface class IMercadoPagoRepository {
  Uri getUrlConfig({required String establishmentId, required String userAccessToken});
  Future<MercadoPagoModel> getToken(String code);
  Future<MercadoPagoModel> refreshToken(String refreshToken);
  Future<OrderInvoice> generatePix(
      {required String token,
      required double value,
      required String title,
      required String email,
      required EstablishmentModel establishment,
      String? userId});
  Future<String> getPaymentStatus({required String token, required String paymentId});
  Future<List<String>> getPaymentMethods(String token);
  Future<void> refoundPayment({required String token, required String paymentId});
}
