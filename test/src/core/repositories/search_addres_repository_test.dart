import 'package:flutter_test/flutter_test.dart';
import 'package:paipfood_package/paipfood_package.dart';

void main() {
  final http = HttpDio(baseOptions: BaseOptions(baseUrl: Env.geoapifyBaseUrl), autoToast: false);
  final repository = GeoapifyRepository(http: http);

  test('searchAddress', () async {
    //Arrange
    const query = "Rua ibirapuera, 183, Dom bosco";
    //Act
    final request = await repository.autoComplete(query);
    //Assert
    expect(request, isA<List<AddressModel>>());
  });
}
