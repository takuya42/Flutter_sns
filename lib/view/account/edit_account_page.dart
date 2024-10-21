import 'package:flutter/material.dart';
import 'package:flutter_sns/model/account.dart';
import 'package:flutter_sns/utils/authentication.dart';
import 'package:flutter_sns/utils/widget_utils.dart';

class EditAccountPage extends StatefulWidget {
  const EditAccountPage({super.key});

  @override
  State<EditAccountPage> createState() => _EditAccountPageState();
}

class _EditAccountPageState extends State<EditAccountPage> {
  Account? myAccount = Authentication.myAccount;
  TextEditingController nameController = TextEditingController();
  TextEditingController userIdController = TextEditingController();
  TextEditingController selfIntroductionController = TextEditingController();

  @override
  void initState() {
    if (myAccount != null) {
      nameController = TextEditingController(text: myAccount!.name);
      userIdController = TextEditingController(text: myAccount!.userId);
      selfIntroductionController = TextEditingController(text: myAccount!.selfIntroduction);
    } else {
      nameController = TextEditingController();
      userIdController = TextEditingController();
      selfIntroductionController = TextEditingController();
    }
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WidgetUtils.createAppBar('プロフィール編集'),
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

                 SizedBox(height: 50,),
                ElevatedButton(
                    onPressed: () async{
                      if(nameController.text.isNotEmpty &&
                          userIdController.text.isNotEmpty &&
                          selfIntroductionController.text.isNotEmpty) {//全ての入力欄に記入があった場合にログインページに戻れる

                        }
                      },
                    child: const Text('更新')
                ),
              ]
            ),
          ),
        ),
    );
  }
}
