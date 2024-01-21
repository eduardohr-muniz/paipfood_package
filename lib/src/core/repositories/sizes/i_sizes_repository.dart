import 'package:paipfood_package/paipfood_package.dart';

abstract interface class ISizesRepository {
  Future<List<SizeModel>> getByEstablishmentId(String id, {bool? visible});
  Future<List<SizeModel>> upsert({required List<SizeModel> sizes, required AuthModel auth});
  Future<void> delete({required String id, required AuthModel auth, bool isDeleted});
}
