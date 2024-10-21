import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sns/utils/authentication.dart';
import 'package:flutter_sns/view/screen.dart';
import 'package:flutter_sns/view/start_up/create_account_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  String? errorMessage; // エラーメッセージ用の変数
  bool _isObscured = true; // パスワードの表示状態

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              SizedBox(height: 50,),
              Text('Flutter SNS', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: SizedBox(
                  width: 300,
                  child: TextField(
                    controller: emailController,
                    decoration: InputDecoration(hintText: 'メールアドレス'),
                  ),
                ),
              ),
              SizedBox(
                width: 300,
                child: TextField(
                  controller: passController,
                  obscureText: _isObscured, // 状態に応じてパスワードを隠す
                  decoration: InputDecoration(
                    hintText: 'パスワード',
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isObscured ? Icons.visibility_off : Icons.visibility, // アイコンを切り替え
                      ),
                      onPressed: () {
                        setState(() {
                          _isObscured = !_isObscured; // 表示状態を切り替え
                        });
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              if (errorMessage != null) // エラーメッセージがあれば表示
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    errorMessage!,
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              RichText(
                text: TextSpan(
                  style: TextStyle(color: Colors.black),
                  children: [
                    TextSpan(text: 'アカウントを作成していない方は'),
                    TextSpan(
                      text: 'こちら',
                      style: TextStyle(color: Colors.blue),
                      recognizer: TapGestureRecognizer()..onTap = () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => CreateAccountPage()));
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 50,),
              ElevatedButton(
                onPressed: () async {
                  var result = await Authentication.emailSignIn(email: emailController.text, pass: passController.text);
                  if (result == true) {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Screen()));
                  } else {
                    setState(() {
                      errorMessage = 'ログインに失敗しました。'; // エラーメッセージを更新
                    });
                  }
                },
                child: Text('emailでログイン'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
