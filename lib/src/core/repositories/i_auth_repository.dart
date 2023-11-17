import 'package:paipfood_package/paipfood_package.dart';

abstract class IAuthRepository {
  Future<AuthModel> signUpByEmail({required String email, required String password});
  Future<AuthModel> loginByEmail({required String email, required String password});
  Future<AuthModel> signUpByPhone({required String phone});
  Future<AuthModel> loginByPhone({required String phone});
  Future<AuthModel> refreshToken({required AuthModel auth});
  Future<void> logout();
  Future<bool> userExists({required String value});
  Future<AuthModel> updateUser({required AuthModel auth});
  Future<void> updateEmail({required AuthModel auth, required String newEmail});
  Future<void> forgotPassword({required String email});
  Future<void> updatePassword({required AuthModel auth, required String newPassword});
  Future<UserModel> getUser({required AuthModel auth});
}
