abstract class ILocalStorage {
  Future<Map?> get(String boxId, {required String key});
  Future<Map?> getAll(String boxId);
  Future<Map?> getAllByKeys(String boxId, {required List<String> keys});
  Future<void> put(String boxId, {required String key, required Map value});
  Future<void> putTransaction(String boxId, {required List<Map> values});
  Future<void> delete(String boxId, {required List<String> keys});
  Future<void> clearBox(String boxId);
  Future<void> clearDatabase();
}
