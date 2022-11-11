import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:school_app/models/user_model.dart';

class AuthRepo {
  Future<void> signInWith(
      {required String email, required String password}) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } catch (error) {
      rethrow;
    }
  }

  Future<bool> signUpWith(
      {required String email, required String password}) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return false;
    } catch (error) {
      rethrow;
    }
  }

  Future<void> createUser({
    required UserCreateModel user,
  }) async {
    try {
      await FirebaseFirestore.instance.collection("users").add(user.toJson());
    } catch (error) {
      rethrow;
    }
  }
}
