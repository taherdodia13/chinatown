import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../data/user_model.dart';

class AuthRepository {
  final FirebaseAuth _firebaseAuth;

  AuthRepository({required FirebaseAuth firebaseAuth})
      : _firebaseAuth = firebaseAuth;

  Future<UserModel?> signUp({
    required String email,
    required String password,
    required bool isAdmin,
  }) async {
    try {
      var response = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (response.user != null) {
        var user = response.user!;
        UserModel userData = UserModel(
          email: email,
          name: user.displayName ?? 'Unknown',
          uid: user.uid,
          isAdmin: isAdmin,
        );
        String collectionPath = isAdmin ? '/sellers' : '/users';
        await FirebaseFirestore.instance
            .collection(collectionPath)
            .doc(user.uid)
            .set(
              userData.toMap(),
            );
        return userData;
      } else {
        throw FirebaseAuthException(
          code: 'USER_NULL',
          message: 'User creation succeeded but user is null',
        );
      }
    } on FirebaseAuthException catch (e) {
      print('Firebase Auth Exception: ${e.code}, ${e.message}');
      return null;
    } catch (e) {
      print('General Exception: $e');
      return null;
    }
  }

  Future<FirebaseAuthResult> logIn({
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return FirebaseAuthResult(success: true);
    } on FirebaseAuthException catch (e) {
      return FirebaseAuthResult(
        success: false,
        errorCode: e.code,
        errorMessage: e.message,
      );
    } catch (e) {
      return FirebaseAuthResult(
        success: false,
        errorCode: 'general_error',
        errorMessage: 'An unexpected error occurred',
      );
    }
  }

  Future<void> logOut() async {
    await _firebaseAuth.signOut();
  }

  Future<UserModel?> fetchUserModel(String userId) async {
    try {
      var userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .get();
      if (userDoc.exists) {
        return UserModel.fromMap(userDoc.data() as Map<String, dynamic>);
      } else {
        var sellerDoc = await FirebaseFirestore.instance
            .collection('sellers')
            .doc(userId)
            .get();
        if (sellerDoc.exists) {
          return UserModel.fromMap(sellerDoc.data() as Map<String, dynamic>);
        }
      }
      return null;
    } catch (e) {
      print('Error fetching user model: $e');
      return null;
    }
  }
}

class FirebaseAuthResult {
  final bool success;
  final String? errorCode;
  final String? errorMessage;

  FirebaseAuthResult({
    required this.success,
    this.errorCode,
    this.errorMessage,
  });
}
