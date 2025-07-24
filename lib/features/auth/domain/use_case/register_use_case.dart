import 'package:reco_genie_internship/features/auth/domain/repo/auth_repo.dart';

class RegisterUseCase {
  final AuthRepo authRepo;

  RegisterUseCase(this.authRepo);
  Future<void> call({
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
