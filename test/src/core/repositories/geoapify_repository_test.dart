import 'package:flutter_test/flutter_test.dart';
import 'package:paipfood_package/paipfood_package.dart';

void main() {
  final repository = GeoapifyRepository(http: HttpDio(baseOptions: BaseOptions(baseUrl: Env.geoapifyBaseUrl)));

  test('autoComplete', () async {
    //Arrange
    const address = "Rua mario quinteiro";
    //Act
    final request = await repository.autoComplete(address);
    //Assert
    expect(request, isA<List<AddressModel>>());
  });
}
