import 'package:flutter_test/flutter_test.dart';
import 'package:paipfood_package/paipfood_package.dart';

void main() {
  final http = HttpDio(autoToast: false);
  final AddressModel addressmock = AddressModel(lat: 0.1, lon: 2.4, id: 2, city: "Tupi", country: "Brasil");
  final repository = AddressRepository(http: http);
  test('insertAddress', () async {
    //Arrange

    //Act
    final request = await repository.insert(addressmock);

    //Assert
    expect(request, isA<AddressModel>());
  });
  test('updateAddress', () async {
    //Arrange

    //Act
    final request = await repository.update(addressmock);

    //Assert
    expect(request, isA<AddressModel>());
  });

  test('getAddressByEstablishmentId', () async {
    //Arrange

    //Act
    final request = await repository.getByEstablishmentId(17);

    //Assert
    expect(request, isA<AddressModel>());
  });
  test('getAddressByUserId', () async {
    //Arrange

    //Act
    final request = await repository.getByUserId("9bde7654-6fcf-4b45-8d58-d1cbe5f9f259");

    //Assert
    expect(request, isA<List<AddressModel>>());
  });
  test('deleteAddressByUserId', () async {
    //Arrange

    //Act
    await repository.deleteByUserId("9bde7654-6fcf-4b45-8d58-d1cbe5f9f259");

    //Assert
  });
}
