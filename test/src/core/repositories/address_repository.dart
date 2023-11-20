import 'package:flutter_test/flutter_test.dart';
import 'package:paipfood_package/paipfood_package.dart';

void main() {
  final http = HttpDio(autoToast: false);
  final repository = AddressRepository(http: http);
  test('', () async {
    //Arrange

    //Act

    //Assert
  });
}
