abstract class ILocalStorage {
  Future<String?> get(String boxId, {required String key});
  Future<List<String>>? getAll(String boxId);
  Future<void> put(String boxId, {required String key, required String value});
  Future<void> delete(String boxId, {required String key});
}
