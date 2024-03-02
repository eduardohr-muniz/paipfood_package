import 'package:paipfood_package/paipfood_package.dart';

abstract interface class IOrderRepository {
  Future<OrderModel> get(String id);
  Future<List<OrderModel>> getByEstablishmentId(String id, {DateTime? initialDate, DateTime? finalDate});
  Future<List<OrderModel>> getByUserId(String userId, {DateTime? initialDate, DateTime? finalDate});
  Future<List<OrderModel>> getByUserIdAndEstablishmentId(String userId, String establishmentId, {DateTime? initialDate, DateTime? finalDate});
  Future<List<OrderModel>> upsert({required List<OrderModel> orders, required AuthModel auth});
  Future<void> delete({required String id, required AuthModel auth, bool isDeleted = false});
}
