import 'package:reco_genie_internship/features/auth/domain/repo/auth_repo.dart';

class LoginUseCase {
  final AuthRepo authRepo;

  LoginUseCase(this.authRepo);
  Future<void> call({required String email, required String password}) async {
    return await authRepo.login(email: email, password: password);
  }
}
