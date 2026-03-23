import 'dart:developer';

import 'package:depifinalproject/core/errors/custom_expetion.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthServiecs {
  FirebaseAuth firebaseAuthInstance = FirebaseAuth.instance;

  // to delete user from firebase Auth
  Future<void> deletedUser() async {
    await firebaseAuthInstance.currentUser!.delete();
  }

  // check if the user was sign in or not to save user state in local storage
  bool isSignedIn() {
    log('the error code in FirebaseAuthServiecs.isSignedIn ');
    return firebaseAuthInstance.currentUser != null;
  }

  // 🟫 هل البريد مفعل؟
  Future<bool> checkEmailVerified() async {
    final user = firebaseAuthInstance.currentUser;
    if (user == null) return false;

    await user.reload();
    return user.emailVerified;
  }

  // 📩 إرسال رابط التفعيل
  // Future<void> sendEmailVerification() async {
  //  await firebaseAuthInstance.currentUser!.sendEmailVerification();

    
  // }
  Future<void> sendEmailVerification(User user) async {
  await user.sendEmailVerification();
}

  // 🚪 تسجيل الخروج
  Future<void> signOut() async {
    await firebaseAuthInstance.signOut();
    await GoogleSignIn().signOut();
  }
  // sign up with email and passord method

  Future<User> signUpWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await firebaseAuthInstance
          .createUserWithEmailAndPassword(email: email, password: password);
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log(
        'the error code in FirebaseAuthServiecs.createUserWithEmailAndPassword $e of type ${e.code}',
      );
      if (e.code == 'weak-password') {
        throw CustomExpetion(message: 'كلمه المرور ضعيفه جدا');
      } else if (e.code == 'email-already-in-use') {
        throw CustomExpetion(message: ' الايميل مستخدم بالفعل ');
      } else if (e.code == 'invalid-email') {
        throw CustomExpetion(message: 'الايميل غير صالح');
      } else if (e.code == 'operation-not-allowed') {
        throw CustomExpetion(message: 'عمليه انشاء الحساب غير مسموحه حاليا');
      } else if (e.code == 'user-disabled') {
        throw CustomExpetion(message: 'تم تعطيل هذا المستخدم');
      } else if (e.code == 'user-not-found') {
        throw CustomExpetion(message: 'المستخدم غير موجود');
      } else if (e.code == 'too-many-requests') {
        throw CustomExpetion(message: 'تم ارسال العديد من الطلبات حاول لاحقا');
      } else if (e.code == 'network-request-failed') {
        throw CustomExpetion(message: 'لا يوجد اتصال بالانترنت');
      } else if (e.code == 'network-error') {
        throw CustomExpetion(message: 'لا يوجد اتصال بالانترنت');
      } else if (e.code == 'unknown') {
        throw CustomExpetion(message: 'حدث خطأ ما حاول مره اخري');
      } else {
        throw CustomExpetion(message: 'حدث خطأ ما حاول مره اخري');
      }
    } catch (e) {
      log(
        'the error in FirebaseAuthServiecs.createUserWithEmailAndPassword is $e',
      );
      throw CustomExpetion(message: 'حدث خطأ ما حاول مره اخري');
    }
  }

  // login with email and password method
  Future<User> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await firebaseAuthInstance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log(
        'the error code in FirebaseAuthServiecs.signInWithEmailAndPassword $e ofType ${e.code}',
      );

      if (e.code == 'invalid-email') {
        throw CustomExpetion(message: 'الايميل غير صالح');
      } else if (e.code == 'user-not-found') {
        throw CustomExpetion(message: 'المستخدم غير موجود');
      } else if (e.code == 'invalid-credential') {
        throw CustomExpetion(
          message: 'البريد الالكتروني او كلمه المرور غير صحيحه',
        );
      } else if (e.code == 'wrong-password') {
        throw CustomExpetion(message: 'كلمه المرور غير صحيحه');
      } else if (e.code == 'too-many-requests') {
        throw CustomExpetion(message: 'تم ارسال العديد من الطلبات حاول لاحقا');
      } else if (e.code == 'network-request-failed') {
        throw CustomExpetion(message: 'لا يوجد اتصال بالانترنت');
      } else if (e.code == 'network-error') {
        throw CustomExpetion(message: 'لا يوجد اتصال بالانترنت');
      } else {
        throw CustomExpetion(message: 'حدث خطأ ما حاول مره اخري');
      }
    } catch (e) {
      log('the error in FirebaseAuthServiecs.signInWithEmailAndPassword is $e');

      throw CustomExpetion(message: 'حدث خطأما حاول مره اخري');
    }
  }

  // sign in with google method
  Future<User> signInWithGoogle() async {
    // to open dailog to choose google account
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    // if (googleUser == null) return nulll;

    //  get the authentication object carry tokens  to provide to firebase
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // the main method in fire base
    return (await firebaseAuthInstance.signInWithCredential(credential)).user!;
  }
}
