import 'dart:typed_data';

abstract interface class IBucketRepository {
  Future<String> insertImage({required String path, required Uint8List image});
  Future<String> updateImage({required String path, required Uint8List image});
  Future<void> deleteImages(List<String> paths);
}
