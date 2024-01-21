import 'dart:async';

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
    );
    final AuthModel authModel = AuthModel.fromMap(request.data);
    await http.post(
      "rest/v1/users_",
      data: authModel.user?.toJsonUsers_(),
      headers: {"Authorization": "Bearer ${authModel.accessToken}"},
    );
    return authModel;
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
      data: authModel.user?.toJsonUsers_(),
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
    AuthModel auth = AuthModel.fromMap(request.data);
    final user = await getUser(auth: auth);
    auth = auth.copyWith(user: user);
    auth_ = auth;
    return auth;
  }

  @override
  Future<AuthModel> loginByPhone({required String phone}) async {
    final request = await http.post(
      "auth/v1/token?grant_type=password",
      data: {"phone": phone, "password": Env.passwordDefault},
    );

    AuthModel auth = AuthModel.fromMap(request.data);
    final user = await getUser(auth: auth);
    auth = auth.copyWith(user: user);

    return auth;
  }

  @override
  Future<void> logout({required AuthModel auth}) async {
    await http.post("auth/v1/logout", headers: {"Authorization": "Bearer ${auth.accessToken}"});
  }

  @override
  Future<AuthModel> refreshToken({required AuthModel auth}) async {
    final request = await http.post(
      "auth/v1/token?grant_type=refresh_token",
      data: {"refresh_token": auth.refreshToken},
    );

    final AuthModel authModel = AuthModel.fromMap(request.data);

    final reqUser_ = await http.get(
      "rest/v1/users_?id=eq.${authModel.user!.id}&select=*",
      headers: {"Authorization": "Bearer ${authModel.accessToken}"},
    );
    final List<UserModel> user_ = reqUser_.data.map<UserModel>((user) {
      return UserModel.fromMap(user);
    }).toList();

    if (authModel.user!.email != user_.first.email) {
      await updateUser(auth: authModel);
    }
    AuthModel result = authModel.copyWith(
      user: user_.first.copyWith(email: authModel.user!.email),
    );
    result = result.copyWith(user: user_.first);
    return result;
  }

  @override
  Future<AuthModel> updateUser({required AuthModel auth}) async {
    await http.put(
      "auth/v1/user",
      data: auth.user!.toJson(),
      headers: {"Authorization": "Bearer ${auth.accessToken}"},
    );

    final request = await http.patch(
      "rest/v1/users_?id=eq.${auth.user?.id}",
      data: auth.user!.toJsonUsers_(),
      headers: {"Authorization": "Bearer ${auth.accessToken}"},
    );
    final List<UserModel> result = request.data.map<UserModel>((user) {
      return UserModel.fromMap(user);
    }).toList();

    auth = auth.copyWith(user: result.first);
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

  @override
  Future<void> updateEmail({required AuthModel auth, required String newEmail}) async {
    await http.put(
      "auth/v1/user",
      data: {"email": newEmail},
      headers: {"Authorization": "Bearer ${auth.accessToken}"},
    );
  }

  @override
  Future<void> forgotPassword({required String email}) async {
    await http.post("auth/v1/recover", data: {'email': email});
  }

  @override
  Future<void> updatePassword({required AuthModel auth, required String newPassword}) async {
    await http.put(
      "auth/v1/user",
      data: {"password": newPassword},
      headers: {"Authorization": "Bearer ${auth.accessToken}"},
    );
  }

  @override
  Future<UserModel> getUser({required AuthModel auth}) async {
    final request = await http.get("rest/v1/users_?id=eq.${auth.user!.id}");

    final List<UserModel> user = request.data.map<UserModel>((user) {
      return UserModel.fromMap(user);
    }).toList();
    return user.first;
  }
}
