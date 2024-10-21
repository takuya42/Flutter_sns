// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter_sns/model/account.dart';
//
// class UserFirestore {
//   static final _firestoreInstance = FirebaseFirestore.instance;
//   static final CollectionReference users = _firestoreInstance.collection('users');
//
//   static Future<dynamic> setUser(Account newAccount) async{
//    try {
//     await users.doc(newAccount.id).set({
//        'name' : newAccount.name,
//        'user_id' : newAccount.id,
//         'self_introdction' : newAccount.selfIntroduction,
//        'image_path' : newAccount.imagePath,
//        'created_time' : Timestamp.now(),
//         'updated_time' : Timestamp.now(),
//      });
//       print('新規ユーザー作成完了');
//       return true;
//     } on FirebaseFirestore catch(e) {
//       print('新規ユーザー作成エラー: $e');
//        return false;
//      }
//   }
//  }

//  アカウント作成時にFirebaseにユーザーを追加
