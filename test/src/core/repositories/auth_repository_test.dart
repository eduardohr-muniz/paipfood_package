import 'package:flutter_test/flutter_test.dart';
import 'package:paipfood_package/paipfood_package.dart';

void main() {
  final http = HttpDio(autoToast: false);
  final repository = AuthRepository(http: http);

  const String email = "eduardohr.muniz@gmail.com";
  const String phone = "+5535984091567";

  test('userExsits', () async {
    //Arrange
    //Act
    final result = await repository.userExists(value: email);
    //Assert
    expect(result, isA<bool>());
  });

  test('signUpByEmail', () async {
    //Arrange
    //Act
    final result = await repository.signUpByEmail(email: email, password: Env.passwordDefault);
    //Assert
    expect(result, isA<AuthModel>());
  });

  test('loginByEmail', () async {
    //Arrange
    //Act
    final result = await repository.loginByEmail(email: email, password: Env.passwordDefault);
    //Assert
    expect(result, isA<AuthModel>());
  });

  test('updateEmail', () async {
    //Arrange
    //Act
    final AuthModel auth = await repository.loginByEmail(email: email, password: Env.passwordDefault);

    await repository.updateEmail(auth: auth, newEmail: "eduardohr.muniz@outlook.com");
    //Assert
  });

  test('refreshToken', () async {
    //Arrange
    //Act
    final AuthModel auth = await repository.loginByEmail(email: email, password: Env.passwordDefault);

    final result = await repository.refreshToken(auth: auth);
    //Assert
    expect(result, isA<AuthModel>());
  });

  test('forgotPasswor', () async {
    //Arrange
    //Act
    await repository.forgotPassword(email: email);
    //Assert
  });

  test('signUpByPhone', () async {
    //Arrange
    //Act
    final result = await repository.signUpByPhone(phone: phone);
    //Assert
    expect(result, isA<AuthModel>());
  });

  test('loginByPhone', () async {
    //Arrange
    //Act
    final result = await repository.loginByPhone(phone: phone);
    //Assert
    expect(result, isA<AuthModel>());
  });

  test('updatePassword', () async {
    //Arrange
    const newPassword = "senha123";
    //Act
    final auth = await repository.loginByEmail(email: email, password: Env.passwordDefault);

    await repository.updatePassword(auth: auth, newPassword: newPassword);

    final authNewPassword = await repository.loginByEmail(email: email, password: newPassword);

    await repository.updatePassword(auth: authNewPassword, newPassword: Env.passwordDefault);

    //Assert
  });
  test('updateUserPhone', () async {
    //Arrange
    //Act
    AuthModel auth = await repository.loginByPhone(phone: phone);
    auth = auth.copyWith(
      user: auth.user!.copyWith(phone: "+5535991705812"),
    );
    final result = await repository.updateUser(auth: auth);

    //Assert
    expect(result, isA<AuthModel>());

    final result_ = await repository.loginByPhone(phone: "+5535991705812");

    expect(result_, isA<AuthModel>());
  });
}
