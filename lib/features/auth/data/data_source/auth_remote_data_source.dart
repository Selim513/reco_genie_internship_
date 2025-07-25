import 'package:firebase_auth/firebase_auth.dart';
import 'package:reco_genie_internship/core/errors/firebase_error.dart';
import 'package:reco_genie_internship/core/utils/service_locator.dart';

abstract class AuthRemoteDataSource {
  Future<void> register({
    required String name,
    required String email,
    required String password,
  });
  Future<void> login({required String email, required String password});
}

class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  final FirebaseAuth auth = getIt.get<FirebaseAuth>();
  @override
  Future<void> login({required String email, required String password}) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      if (auth.currentUser != null && !auth.currentUser!.emailVerified) {
        throw Exception('Please verify your email before logging in.');
      }
    } on FirebaseAuthException catch (e) {
      throw Exception(FirebaseError.getLoginErrorMessage(e));
    } catch (e) {
      if (e is Exception) {
        rethrow;
      }
      throw Exception('An unexpected error occurred during login.');
    }
  }

  @override
  Future<void> register({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final credential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // ✅ تحديث الـ display name
      if (credential.user != null && name.isNotEmpty) {
        await credential.user!.updateDisplayName(name);
        await credential.user!.sendEmailVerification();
      }
    } on FirebaseAuthException catch (e) {
      throw Exception(FirebaseError.getRegisterErrorMessage(e));
    } catch (e) {
      throw FirebaseAuthException(
        code: 'unknown',
        message: 'An unexpected error occurred during registration.',
      );
    }
  }
}
