import 'package:paipfood_package/paipfood_package.dart';

abstract interface class IItemsRepository {
  Future<List<ItemModel>> getByEstablishmentId(int id, {bool? visible});
  Future<List<ItemModel>> upsert({required List<ItemModel> items, required AuthModel auth});
  Future<void> delete({required int id, required AuthModel auth});
}
