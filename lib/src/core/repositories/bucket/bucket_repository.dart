import 'dart:typed_data';

import 'package:paipfood_package/paipfood_package.dart';

class BucketRepository implements IBucketRepository {
  IHttp http;
  BucketRepository({
    required this.http,
  });
  @override
  Future<void> deleteImages(List<String> paths) async {
    await http.delete(
      "object/images",
      headers: {"Content-Type": "application/json"},
      data: {"prefixes": paths.map((e) => e.replaceFirst("images/", "")).toList()},
    );
  }

  @override
  Future<String> insertImage({required String path, required Uint8List image}) async {
    try {
      final req = await http.post(
        "object/images/$path",
        headers: {"Content-Type": "image/png"},
        data: image,
      );
      return req.data["Key"];
    } catch (e) {
      return await updateImage(path: path, image: image);
    }
  }

  @override
  Future<String> updateImage({required String path, required Uint8List image}) async {
    try {
      final req = await http.put(
        "object/images/$path",
        headers: {"Content-Type": "image/png"},
        data: image,
      );
      return req.data["Key"];
    } catch (e) {
      return await insertImage(path: path, image: image);
    }
  }
}
