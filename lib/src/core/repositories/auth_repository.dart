import 'package:paipfood_package/paipfood_package.dart';

class AuthRepository implements IAuthRepository {
  final HttpDio http;
  AuthRepository({
    required this.http,
  });

  @override
  Future<AuthModel> signUpByEmail({required String email, required String password}) async {
    final request = await http.post(
      "auth/v1/signup",
      data: {"email": email, "password": password},
      headers: {"Authorization": "Bearer ${Env.supaApiKey}"},
    );
    final AuthModel authModel = AuthModel.fromMap(request.data);
    await http.post(
      "rest/v1/users_",
      data: authModel.toJson(),
      headers: {"Authorization": "Bearer ${authModel.accessToken}"},
    );
    return authModel;
  }

  @override
  Future<AuthModel> loginByEmail({required String email, required String password}) async {
    final request = await http.post(
      "auth/v1/token?grant_type=password",
      data: {"email": email, "password": password},
    );
    return AuthModel.fromMap(request.data);
  }

  @override
  Future<AuthModel> loginByPhone({required String phone}) async {
    final request = await http.post(
      "auth/v1/token?grant_type=password",
      data: {"email": phone, "password": Env.passwordDefault},
    );
    return AuthModel.fromMap(request.data);
  }

  @override
  Future<void> logout() async {
    await http.post("auth/v1/logout", headers: {"Authorization": "Bearer ${authModel?.accessToken}"});
  }

  @override
  Future<AuthModel> refreshToken({required AuthModel auth}) async {
    final request = await http.post(
      "auth/v1/token?grant_type=refresh_token",
      data: {"refresh_token": auth.refreshToken},
    );
    return AuthModel.fromMap(request.data);
  }

  @override
  Future<AuthModel> signUpByPhone({required String phone}) async {
    final request = await http.post(
      "auth/v1/signup",
      data: {"phone": phone, "password": Env.passwordDefault},
      headers: {"Authorization": "Bearer ${Env.supaApiKey}"},
    );
    final AuthModel authModel = AuthModel.fromMap(request.data);
    await http.post(
      "rest/v1/users_",
      data: authModel.toJson(),
      headers: {"Authorization": "Bearer ${authModel.accessToken}"},
    );
    return authModel;
  }

  @override
  Future<AuthModel> updateUser({required AuthModel auth}) async {
    final request = await http.patch(
      "rest/v1/users_?id=eq.${auth.user?.id}",
      data: auth.toJson(),
      headers: {"Authorization": "Bearer ${auth.accessToken}"},
    );

    final AuthModel authModel = AuthModel.fromMap(request.data);
    auth = authModel;

    await http.patch(
      "auth/v1/user",
      data: auth.toJson(),
      headers: {"Authorization": "Bearer ${auth.accessToken}"},
    );

    return auth;
  }

  @override
  Future<bool> userExists({required String value}) async {
    final request = await http.post(
      "rest/v1/rpc/user_exists",
      headers: {"Authorization": "Bearer ${Env.supaApiKey}"},
      data: {"body": value},
    );
    return request.data;
  }
}
