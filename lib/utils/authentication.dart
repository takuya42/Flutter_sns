import 'package:firebase_auth/firebase_auth.dart';

class Authentication {
  static final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  static User? currentFirebaseUser;

  static var myAccount;

  // サインアップメソッド
  static Future<dynamic> signUp({required String email, required String pass}) async {
    try {
      await firebaseAuth.createUserWithEmailAndPassword(email: email, password: pass);
      print('auth登録完了');
      return true;
    } on FirebaseAuthException catch (e) {
      print('auth登録エラー: ${e.message}');
      return e.message; // エラーメッセージを返す
    }
  }

  // サインインメソッド
  static Future<dynamic> emailSignIn({required String email, required String pass}) async {
    try {
      final UserCredential result = await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: pass,
      );
      currentFirebaseUser = result.user;
      print('authサインイン完了');
      return true;
    } on FirebaseAuthException catch (e) {
      print('authサインエラー: ${e.message}');
      return e.message; // エラーメッセージを返す
    }
  }
  static Future<void> signOut() async{
    await firebaseAuth.signOut();
  }
}
