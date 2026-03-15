import 'package:auth/data/sources/remote/auth/auth_remote_service.dart';
import '../../models/response_model.dart';

class AuthRepository {
  final AuthRemoteService remoteServices;
  AuthRepository({required this.remoteServices});

  // login
  Future<ResponseModel> logIn({
    required String email,
    required String password,
  }) async {
    return await remoteServices.logIn(email: email, password: password);
  }
}
