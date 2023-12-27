import 'package:flutter_test/flutter_test.dart';
import 'package:paipfood_package/paipfood_package.dart';

void main() {
  final http = HttpDio();
  final AddressModel addressmock = AddressModel(id: uuid, lat: 0.1, long: 2.4, city: "Tupi", country: "Brasil");
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
    final request = await repository.getByEstablishmentId('9bde7654-6fcf-4b45-8d58-d1cbe5f9f259');

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
