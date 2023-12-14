import 'package:paipfood_package/paipfood_package.dart';

abstract interface class IComplementsRepository {
  Future<List<ComplementModel>> getByEstablishmentId(int id, {bool? visible});
  Future<List<ComplementModel>> upsert({required List<ComplementModel> complements, required AuthModel auth});
  Future<void> delete({required int id, required AuthModel auth});
}
