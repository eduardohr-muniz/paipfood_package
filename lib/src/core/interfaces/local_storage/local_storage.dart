import 'dart:io';

import 'package:flutter/foundation.dart' show kIsWeb;

import '../../../../paipfood_package.dart';

late BoxCollection _collection;

class LocalStorage implements ILocalStorage {
  final logger = Log(printer: PrettyPrinter());

  static void init(Set<String> boxNames) async {
    String path = "";
    if (kIsWeb) {
    } else {
      path = Directory.current.path;
    }
    Hive.init(path);

    _collection = await BoxCollection.open(
      Env.dataBase, // Name of your database
      boxNames, // Names of your boxes
      path: path, // Path where to store your boxes (Only used in Flutter / Dart IO)
      // key: HiveAesCipher([0, 1, 8, 0, 4, 9, 9, 3]), // Key to encrypt your boxes (Only used in Flutter / Dart IO)
    );
  }

  @override
  Future<void> delete(String boxId, {required List<String> keys}) async {
    final box = await _collection.openBox<Map>(boxId);
    await box.deleteAll(keys);

    _logInfos(boxId, "DELETE", key: keys.toString());
  }

  @override
  Future<Map?> get(String boxId, {required String key}) async {
    final box = await _collection.openBox<Map>(boxId);
    final result = await box.get(key);
    _logInfos(boxId, "GET", key: key, value: result);
    return result;
  }

  @override
  Future<void> put(String boxId, {required String key, required Map value, bool transaction = false}) async {
    final box = await _collection.openBox<Map>(boxId);
    await box.put(key, value);
    _logInfos(boxId, "PUT", key: key, value: value);
  }

  @override
  Future<void> putTransaction(String boxId, {required List<Map> values}) async {
    final box = await _collection.openBox<Map>(boxId);
    await _collection.transaction(
      () async {
        values.map((e) async => await box.put(e['id'], e)).toList();
      },
      boxNames: [boxId],
    );
    _logInfos(boxId, "PUT_TRANSACTION", key: boxId, value: values.toString());
    return;
  }

  @override
  Future<Map?> getAll(String boxId) async {
    final box = await _collection.openBox<Map>(boxId);
    final content = await box.getAllValues();

    final result = Map.fromIterable(content.values);

    _logInfos(boxId, "GETALL", key: boxId, value: "${result.length}");
    return result;
  }

  @override
  Future<Map?> getAllByKeys(String boxId, {required List<String> keys}) async {
    final box = await _collection.openBox<Map>(boxId);
    final content = await box.getAll(keys);

    final result = Map.fromIterable(content);

    _logInfos(boxId, "GETALLBYKEYS", key: boxId, value: "${result.length}");
    return result;
  }

  void _logInfos(String box, String method, {String? key, dynamic value}) {
    logger.d('Method: $method \nBox:$box \nKey: $key \nvalue: $value');
  }

  Future<void> openBox(String name) async {
    await _collection.openBox<Map>(name);
  }

  Future<void> closeBox(String name) async {
    final bool boxExist = await Hive.boxExists(name);
    if (boxExist) {
      final box = Hive.box<Map>(name);
      await box.close();
    }
  }

  @override
  Future<void> clearBox(String boxId) async {
    final box = await _collection.openBox<Map>(boxId);
    await box.clear();

    _logInfos(boxId, "CLEAR");
  }

  @override
  Future<void> clearDatabase() async {
    String path = "";
    if (kIsWeb) {
      path = "/assets/db";
    } else {
      path = Directory.current.path;
    }
    await Hive.deleteBoxFromDisk(path);
  }
}
