import 'package:reco_genie_internship/features/auth/data/data_source/auth_remote_data_source.dart';
import 'package:reco_genie_internship/features/auth/domain/repo/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final AuthRemoteDataSource auth;

  AuthRepoImpl(this.auth);
  @override
  Future<void> login({required String email, required String password}) async {
    try {
      await auth.login(email: email, password: password);
    } catch (e) {
      print(e);
    }
  }

  @override
  Future<void> register({
    required String name,
    required String email,
    required String password,
  }) async {
    await auth.register(name: name, email: email, password: password);
  }
}
