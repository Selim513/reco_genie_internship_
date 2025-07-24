import 'package:reco_genie_internship/features/auth/domain/repo/auth_repo.dart';

class AuthUseCase {
  final AuthRepo authRepo;

  AuthUseCase(this.authRepo);
  Future<void> login({required String email, required String password}) async {
    return await authRepo.login(email: email, password: password);
  }
}
