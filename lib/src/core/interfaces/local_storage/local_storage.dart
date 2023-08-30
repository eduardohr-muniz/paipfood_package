part of '../../../../paipfood_package.dart';

class LocalStorage implements ILocalStorage {
  LocalStorage();

  final logger = Log(printer: PrettyPrinter());

  static init() {
    final hive = LocalStorage.initHive();
    return hive;
  }

  static initHive() async {
    String path = "";
    if (kIsWeb) {
      path = "/assets/db";
    } else {
      path = Directory.current.path;
    }
    Hive.init(path);
  }

  @override
  Future<void> delete<T>(String boxId, {required String key}) async {
    var box = Hive.box<T>(boxId);
    box.delete(key);

    _logInfos(boxId, "DELETE", key: key);
  }

  @override
  Future<T?> get<T>(String boxId, {required String key}) async {
    var box = Hive.box<T>(boxId);
    final result = box.get(key);

    _logInfos(boxId, "GET", key: key, value: result);
    return result;
  }

  @override
  Future<void> put<T>(String boxId, {required String key, required T value}) async {
    var box = Hive.box<T>(boxId);
    await box.put(key, value);

    _logInfos(boxId, "PUT", key: key, value: value);
  }

  @override
  Future<List<T>>? getAll<T>(String boxId) async {
    var box = Hive.box<T>(boxId);
    List<T> resultMap = [];
    try {
      resultMap = List<T>.from(box.values);
    } catch (e) {
      for (var key in box.keys) {
        final content = box.get(key);
        if (content != null) {
          try {
            resultMap.add(content);
          } catch (e) {
            box.delete(key);
            _logInfos(boxId, "DELETE", key: key, value: content);
          }
        }
      }
    }
    _logInfos(boxId, "GETALL", key: box.keys.toString(), value: "${resultMap.length}");
    return resultMap;
  }

  void _logInfos(String box, String method, {String? key, dynamic value}) {
    logger.d('Method: $method \nBox:$box \nKey: $key \nvalue: $value');
  }
}
