import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_sns/firestore/users.dart';
import 'package:flutter_sns/model/account.dart';
import 'package:flutter_sns/utils/authentication.dart';

import '../../utils/widget_utils.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({super.key});

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController userIdController = TextEditingController();
  TextEditingController selfIntroductionController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController emailController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WidgetUtils.createAppBar('新規登録'),
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              const SizedBox(height: 30,),
              GestureDetector(
                onTap: (){

                },
                child: const CircleAvatar(
                  radius: 40,
                  child: Icon(Icons.add),
                ),
              ),
              SizedBox(
                width: 300,
                child: TextField(
                  controller: nameController,
                  decoration: const InputDecoration(hintText: '名前'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: SizedBox(
                  width: 300,
                  child: TextField(
                    controller: userIdController,
                    decoration: const InputDecoration(hintText: 'ユーザーID'),
                  ),
                ),
              ),
              SizedBox(
                width: 300,
                child: TextField(
                  controller: selfIntroductionController,
                  decoration: const InputDecoration(hintText: '自己紹介'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: SizedBox(
                  width: 300,
                  child: TextField(
                    controller: emailController,
                    decoration: const InputDecoration(hintText: 'メールアドレス'),
                  ),
                ),
              ),
              SizedBox(
                width: 300,
                child: TextField(
                  controller: passController,
                  decoration: const InputDecoration(hintText: 'パスワード'),
                ),
              ),
              const SizedBox(height: 50,),
              ElevatedButton(
                  onPressed: () async{
                if(nameController.text.isNotEmpty &&
                    userIdController.text.isNotEmpty &&
                    selfIntroductionController.text.isNotEmpty &&
                    emailController.text.isNotEmpty &&
                    passController.text.isNotEmpty) {      //全ての入力欄に記入があった場合にログインページに戻れる
                  var _result = await Authentication.signUp(
                      email: emailController.text, pass: passController.text);
                  if (_result == true) {
                    Account newAccount = Account(
                      id: _result.user!.uid,
                      name: nameController.text,
                      userId: userIdController.text,
                      selfIntroduction: selfIntroductionController.text,
                    );
                    //         var result = await UserFirestore.setUser(newAccount);
                    //         if(result == true);
                    Navigator.pop(context);
                  }
                }
              },
                  child: const Text('アカウント作成')
              ),
            ],
          ),
        ),
      )
    );

  }
}
