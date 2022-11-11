import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:school_app/helpers/enums/user_type.dart';

import '../models/user_model.dart';
import '../repositories/auth_repo.dart';
import '../resources/strings_manager.dart';
import '../utils/utility_helper.dart';

class AuthProvider with ChangeNotifier {
  final _authRepo = AuthRepo();

  Future<bool> signInWith({
    required String email,
    required String password,
  }) async {
    try {
      await _authRepo.signInWith(email: email, password: password);
      return true;
    } on FirebaseException catch (error) {
      UtilityHelper.showToast(
          message: error.message ?? AppStrings.somethingWentWrong);
      return false;
    } catch (error) {
      UtilityHelper.showToast(message: AppStrings.somethingWentWrong);
      return false;
    }
  }

  Future<bool> signUpWith({
    required String email,
    required String password,
    required String name,
    required String mobile,
    required UserType userType,
  }) async {
    try {
      await _authRepo.signUpWith(email: email, password: password);

      final isSuccessSignIn =
          await signInWith(email: email, password: password);
      if (!isSuccessSignIn) return false;

      final token = await FirebaseMessaging.instance.getToken();
      final isSuccessCreateUser = await createUser(
        user: UserCreateModel(
          name: name,
          email: email,
          fcm: token ?? "",
          mobile: mobile,
          userId: FirebaseAuth.instance.currentUser?.uid ?? '',
          userType: userType.name,
        ),
      );
      return isSuccessCreateUser;
    } on FirebaseException catch (error) {
      UtilityHelper.showToast(
          message: error.message ?? AppStrings.somethingWentWrong);
      return false;
    } catch (error) {
      UtilityHelper.showToast(message: AppStrings.somethingWentWrong);
      return false;
    }
  }

  Future<bool> createUser({
    required UserCreateModel user,
  }) async {
    try {
      await _authRepo.createUser(user: user);
      return true;
    } on FirebaseException catch (error) {
      UtilityHelper.showToast(
          message: error.message ?? AppStrings.somethingWentWrong);
      return false;
    } catch (error) {
      UtilityHelper.showToast(message: AppStrings.somethingWentWrong);
      return false;
    }
  }
}
