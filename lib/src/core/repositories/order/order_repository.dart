import 'package:paipfood_package/paipfood_package.dart';
import 'package:paipfood_package/src/core/repositories/order/i_order_repository.dart';

class OrderRepository implements IOrderRepository {
  final IHttp http;
  OrderRepository({required this.http});
  final table = 'orders';
  final viewInvoices = 'orders_with_invoice';
  @override
  Future<void> delete({required String id, required AuthModel auth, bool isDeleted = false}) async {
    String query = "id=eq.$id";
    if (isDeleted) query = HttpUtils.queryIsDeleted(isDeleted);
    await http.delete(
      "rest/v1/$table?$query",
      headers: {"Authorization": "Bearer ${auth.accessToken}"},
    );
  }

  @override
  Future<OrderModel> get(String id) async {
    final request = await http.get("rest/v1/orders_with_invoice?id=eq.$id&select=*");
    final List list = request.data;
    return list
        .map<OrderModel>((order) {
          return OrderModel.fromMap(order);
        })
        .toList()
        .first;
  }

  @override
  Future<List<OrderModel>> getByEstablishmentId(String id, {DateTime? initialDate, DateTime? finalDate}) async {
    initialDate ??= DateTime.now().subtract(1.days);
    finalDate ??= DateTime.now().add(1.days);
    final request = await http.get("rest/v1/$viewInvoices?establishment_id=eq.$id&created_at=gt.$initialDate&created_at=lt.$finalDate&select=*");
    final List list = request.data;
    return list.map<OrderModel>((order) {
      return OrderModel.fromMap(order);
    }).toList();
  }

  @override
  Future<List<OrderModel>> getByUserId(String userId, {DateTime? initialDate, DateTime? finalDate}) async {
    initialDate ??= DateTime.now().subtract(1.days);
    finalDate ??= DateTime.now().add(1.days);
    final request = await http.get("rest/v1/$viewInvoices?user_id=eq.$userId&created_at=gt.$initialDate&created_at=lt.$finalDate&select=*");
    final List list = request.data;
    return list.map<OrderModel>((order) {
      return OrderModel.fromMap(order);
    }).toList();
  }

  @override
  Future<List<OrderModel>> getByUserIdAndEstablishmentId(String userId, String establishmentId, {DateTime? initialDate, DateTime? finalDate}) async {
    initialDate ??= DateTime.now().subtract(1.days);
    finalDate ??= DateTime.now().add(1.days);
    final request = await http.get(
        "rest/v1/$viewInvoices?user_id=eq.$userId&establishment_id=eq.$establishmentId&created_at=gt.$initialDate&created_at=lt.$finalDate&select=*");
    final List list = request.data;
    return list.map<OrderModel>((order) {
      return OrderModel.fromMap(order);
    }).toList();
  }

  @override
  Future<List<OrderModel>> upsert({required List<OrderModel> orders, required AuthModel auth}) async {
    final request = await http.post(
      "rest/v1/$table",
      headers: HttpUtils.headerUpsertAuth(auth),
      data: orders.map((e) => e.toMap()).toList(),
    );
    final List list = request.data;
    return list.map<OrderModel>((order) {
      return OrderModel.fromMap(order);
    }).toList();
  }
}
