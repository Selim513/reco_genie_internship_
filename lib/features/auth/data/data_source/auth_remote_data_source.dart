import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRemoteDataSource {
  Future<void> register({
    required String name,
    required String email,
    required String password,
  });
  Future<void> login({required String email, required String password});
}

class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  @override
  Future<void> login({required String email, required String password}) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw ('No user found for that email.');
        // print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        throw ('Wrong password provided for that user.');

        // print('Wrong password provided for that user.');
      }
    }
  }

  @override
  Future<void> register({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw ('The password provided is too weak.');
        // print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        throw ('The account already exists for that email.');
        // print('The account already exists for that email.');
      }
    } catch (e) {
      FirebaseAuthException(
        code: e.toString(),
      message: 'There is something went wrong please try again later',
      );
    }
  }
}
