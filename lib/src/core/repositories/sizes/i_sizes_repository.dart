import 'package:paipfood_package/paipfood_package.dart';

abstract interface class ISizesRepository {
  Future<List<SizeModel>> getByEstablishmentId(int id, {bool? visible});
  Future<List<SizeModel>> upsert({required List<SizeModel> sizes, required AuthModel auth});
  Future<void> delete({required int id, required AuthModel auth});
}
