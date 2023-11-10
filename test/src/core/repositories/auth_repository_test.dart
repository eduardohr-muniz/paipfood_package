import 'package:flutter_test/flutter_test.dart';
import 'package:paipfood_package/paipfood_package.dart';

void main() {
  final http = HttpDio(autoToast: false);
  final repository = AuthRepository(http: http);
  test('signUpByEmail', () async {
    //Arrange
    //Act
    final result = await repository.signUpByEmail(email: "eduardo@gmail.com", password: "senha123");
    //Assert
    expect(result, isA<AuthModel>());
  });
  test('signUpByPhone', () async {
    //Arrange
    //Act
    final result = await repository.signUpByPhone(phone: "+5535984091567");
    //Assert
    expect(result, isA<AuthModel>());
  });
  test('userExsits', () async {
    //Arrange
    //Act
    final result = await repository.userExists(value: "5535984091567");
    //Assert
    expect(result, isA<bool>());
  });
}
