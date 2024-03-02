import 'package:flutter_test/flutter_test.dart';
import 'package:paipfood_package/paipfood_package.dart';

Future<void> main() async {
  // const email = "eduardohr.muniz@gmail.com";
  // AuthModel auth = AuthModel();
  final http = HttpDio(baseOptions: HttpUtils.mercadoPago);
  // final authRepository = AuthRepository(http: http);
  // if (auth.accessToken == null) auth = await authRepository.loginByEmail(email: email, password: Env.passwordDefault);
  final repository = MercadoPagoRepository(http: http);
  // const String establishmentId = '22';
  // const String itemId = '2';

  // final itemMock = ItemModel(
  //     id: uuid,
  //     complementId: "",
  //     establishmentId: "establishmentId",
  //     description: "Descrição",
  //     index: 0,
  //     name: "Name",
  //     updatedAt: DateTime.now(),
  //     price: 12.50,
  //     promotionalPrice: 12,
  //     nickName: "teste",
  //     sizes: [],
  //     itemtype: Itemtype.pizza);

  test('upsert', () async {
    //Arrange

    //Act
    final result = await repository.getToken("TG-65baa1620746840001627c18-1657627583");

    //Assert
    expect(result, isA<List<ItemModel>>());
  });
}
