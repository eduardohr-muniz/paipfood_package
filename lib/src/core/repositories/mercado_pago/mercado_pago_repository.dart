import 'package:paipfood_package/paipfood_package.dart';
import 'package:paipfood_package/src/core/models/order_invoice.dart';

class MercadoPagoRepository implements IMercadoPagoRepository {
  final IHttp http;
  MercadoPagoRepository({
    required this.http,
  });

  static String get redirectUri => "https://portal.paipfood.com/mercado_pago/";

  double pixTax(double value) => value * 1 / 100;

  @override
  Future<MercadoPagoModel> getToken(String code) async {
    final request = await http.post('oauth/token', data: {
      "client_id": Env.mercadoPagoClientId,
      "client_secret": Env.mercadoPagoClientSecret,
      "code": code,
      "grant_type": "authorization_code",
      "redirect_uri": redirectUri
    });

    return MercadoPagoModel.fromMap(request.data);
  }

  @override
  Uri getUrlConfig({required String establishmentId, required String userAccessToken}) {
    return Uri(
      scheme: "https",
      host: "auth.mercadopago.com.br",
      path: "/authorization",
      query:
          "client_id=${Env.mercadoPagoClientId}&response_type=code&state=$establishmentId|$userAccessToken&platform_id=mp&redirect_uri=$redirectUri",
    );
  }

  @override
  Future<MercadoPagoModel> refreshToken(String refreshToken) async {
    final request = await http.post(
      'oauth/token/',
      data: {
        "client_id": Env.mercadoPagoClientId,
        "client_secret": Env.mercadoPagoClientSecret,
        "code": refreshToken,
        "grant_type": "authorization_code",
        "redirect_uri": redirectUri
      },
    );

    return MercadoPagoModel.fromMap(request.data);
  }

  @override
  Future<List<String>> getPaymentMethods(String token) async {
    final request = await http.get(
      'payment_methods',
      headers: {'Authorization': 'Bearer $token'},
    );

    final List list = request.data;
    return list.map((e) => e['id']).toList() as List<String>;
  }

  @override
  Future<String> getPaymentStatus({required String token, required String paymentId}) async {
    final request = await http.get(
      'payments/$paymentId',
      headers: {'Authorization': 'Bearer $token', 'X-Idempotency-Key': uuid},
    );
    return request.data['status'];
  }

  @override
  Future<void> refoundPayment({required String token, required String paymentId}) async {
    await http.post(
      'payments/$paymentId/refunds',
      headers: {'Authorization': 'Bearer $token', 'X-Idempotency-Key': uuid},
    );
  }

  @override
  Future<OrderInvoice> generatePix(
      {required String token,
      required double value,
      required String title,
      required String email,
      required EstablishmentModel establishment,
      String? userId}) async {
    final generateEmail = email.contains("@") ? email : "$email@${establishment.fantasyName}.com";

    final request = await http.post(
      'payments',
      headers: {'Authorization': 'Bearer $token', 'X-Idempotency-Key': uuid},
      data: {
        "transaction_amount": value,
        "description": title,
        "payment_method_id": "pix",
        "payer": {
          "email": generateEmail,
          "first_name": establishment.fantasyName,
          "last_name": establishment.fantasyName,
          "identification": {"type": "CPF", "number": Utils.onlyNumbersRgx(establishment.personalDocument)},
          "address": {
            "zip_code": establishment.address?.zipCode ?? "37704110",
            "street_name": establishment.address?.street ?? "Rua Ibirapuera",
            "street_number": establishment.address?.number ?? "183",
            "neighborhood": establishment.address?.neighborhood ?? "Dom bosco",
            "city": establishment.address?.city ?? "Pocos de caldas",
            "federal_unit": establishment.address?.state ?? "MG"
          }
        },
        "application_fee": pixTax(value),
      },
    );

    final OrderInvoice orderInvoice = OrderInvoice.fromMercadoPagoPix(request.data);

    return orderInvoice.copyWith(
      amount: value - (pixTax(value) * 2),
      establishmentId: establishment.id,
      tax: pixTax(value) * 2,
      value: value,
      userId: userId,
    );
  }
}
