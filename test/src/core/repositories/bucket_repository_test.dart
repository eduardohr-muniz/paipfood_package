import 'dart:io';
import 'dart:typed_data';
import 'package:flutter_test/flutter_test.dart';
import 'package:paipfood_package/paipfood_package.dart';

Future<void> main() async {
  final http = HttpDio(baseOptions: HttpUtils.bucketSupabase);
  final bucketRepository = BucketRepository(http: http);

  test('insertImage', () async {
    //Arrange
    final File file = File("assets/flags/AC.png");
    final Uint8List bytes = await file.readAsBytes();
    //Act
    final result = await bucketRepository.insertImage(image: bytes, path: "teste/oi.png");

    //Assert
    expect(result, isA<String>());
  });

  test('deleteImage', () async {
    //Arrange

    //Act
    await bucketRepository.deleteImages(["images/teste/oi.svg"]);

    //Assert
  });
}
