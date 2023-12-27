import 'package:paipfood_package/paipfood_package.dart';

abstract interface class ILatLongsRepository {
  Future<List<LatLongModel>> getByEstablishmentId(String id);
  Future<List<LatLongModel>> upsert({required List<LatLongModel> latLongs, required AuthModel auth});
  Future<void> delete({required String id, required AuthModel auth, bool isDeleted});
}
