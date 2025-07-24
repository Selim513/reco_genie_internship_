import 'package:reco_genie_internship/features/auth/domain/repo/auth_repo.dart';

class AuthUseCase {
  final AuthRepo authRepo;

  AuthUseCase(this.authRepo);
  Future<void> register({
    required String email,
    required String password,
    required String name,
  }) async {
    return await authRepo.register(
      email: email,
      password: password,
      name: name,
    );
  }
}
