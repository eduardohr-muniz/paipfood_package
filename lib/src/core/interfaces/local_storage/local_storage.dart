import 'dart:io';
import '../../../../paipfood_package.dart';
import 'i_local_storage.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class LocalStorage implements ILocalStorage {
  final logger = Log(printer: PrettyPrinter());

  static void init() async {
    String path = "";
    if (kIsWeb) {
      path = "/assets/db";
    } else {
      path = Directory.current.path;
    }
    Hive.init(path);
  }

  @override
  Future<void> delete(String boxId, {required String key}) async {
    final box = Hive.box<String>(boxId);
    await box.delete(key);
    _logInfos(boxId, "DELETE", key: key);
  }

  @override
  Future<String?> get(String boxId, {required String key}) async {
    final box = Hive.box<String>(boxId);
    final result = box.get(key);

    _logInfos(boxId, "GET", key: key, value: result);
    return result;
  }

  @override
  Future<void> put(String boxId, {required String key, required String value}) async {
    final box = Hive.box<String>(boxId);
    await box.put(key, value);

    _logInfos(boxId, "PUT", key: key, value: value);
  }

  @override
  Future<List<String>>? getAll(String boxId) async {
    final box = Hive.box<String>(boxId);
    List<String> resultMap = [];
    try {
      resultMap = List<String>.from(box.values);
    } catch (e) {
      for (var key in box.keys) {
        final content = box.get(key);
        if (content != null) {
          try {
            resultMap.add(content);
          } catch (e) {
            await box.delete(key);
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

  Future<void> openBox(String name) async {
    await Hive.openBox<String>(name);
  }

  Future<void> closeBox(String name) async {
    final bool boxExist = await Hive.boxExists(name);
    if (boxExist) {
      final box = Hive.box(name);
      await box.close();
    }
  }
}
