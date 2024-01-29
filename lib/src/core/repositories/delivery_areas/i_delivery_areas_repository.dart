import 'package:paipfood_package/paipfood_package.dart';

abstract interface class IDeliveryAreasRepository {
  Future<List<DeliveryAreasModel>> getByEstablishmentId(String id);
  Future<List<DeliveryAreasModel>> upsert({required List<DeliveryAreasModel> areas, required AuthModel auth});
  Future<void> delete({required String id, required AuthModel auth, bool isDeleted});
  Future<DeliveryAreasModel> getDeliveryAreaByLatLong({required String establishmentId, required double lat, required double long});
}
