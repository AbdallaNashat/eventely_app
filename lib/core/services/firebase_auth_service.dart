import 'package:eventely/core/services/snack_bar_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

abstract class FirebaseAuthService{

  //firebase auth

  static Future<bool> createAccount({
    required String emailAddress,
    required String password,
  }) async {
    EasyLoading.show();
    try {
      final credential =
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      SnackBarService.showSuccessMessage("Account Created Successfully");
      return Future.value(true);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        SnackBarService.showErrorMessage(
            e.message ?? "The password is too weak");

        return Future.value(false);
      } else if (e.code == 'email-already-in-use') {
        SnackBarService.showErrorMessage(e.message ?? "Email-already-in-use");

        return Future.value(false);
      }
      return Future.value(false);
    } catch (e) {
      return Future.value(false);
    }
  }

  static Future<bool> login({
    required String emailAddress,
    required String password,
  }) async {
    EasyLoading.show();
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password);
      SnackBarService.showSuccessMessage("Login Success");
      return Future.value(true);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        SnackBarService.showErrorMessage(
            e.message ?? "No user found for that email.");

        return Future.value(false);
      } else if (e.code == 'wrong-password') {
        SnackBarService.showErrorMessage(e.message ?? "wrong-password");

        return Future.value(false);
      }
      return Future.value(false);
    } catch (e) {
      return Future.value(false);
    }
  }

}