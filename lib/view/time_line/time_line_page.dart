import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sns/model/account.dart';
import 'package:flutter_sns/model/post.dart';
import 'package:flutter_sns/utils/authentication.dart';
import 'package:flutter_sns/view/start_up/login_page.dart';
import 'package:flutter_sns/view/time_line/post_page.dart';
import 'package:intl/intl.dart';

class TimeLinePage extends StatefulWidget {
  const TimeLinePage({super.key});

  @override
  State<TimeLinePage> createState() => _TimeLinePageState();
}

class _TimeLinePageState extends State<TimeLinePage> {
  Account myAccount = Account(
    id: '1',
    name: 'flutter',
    selfIntroduction: 'こんばんは',
    imagePath: 'https://cdn-icons-png.freepik.com/256/14051/14051861.png?semt=ais_hybrid',
    createdTime: Timestamp.now(),
    updatedTime: Timestamp.now(),
  );

  List<Post> postList = [
    Post(
        id: '1',
        content: '初めまして',
        postAccountId: '1',
        createdTime: DateTime.now()),
    Post(
        id: '2',
        content: '初めまして２回',
        postAccountId: '1',
        createdTime: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('タイムライン'),
          backgroundColor: Theme.of(context).canvasColor,
          elevation: 2,
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text(
                  'メニュー',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),

              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text('ログアウト'),
                onTap: () {
                  Authentication.signOut(); // ログアウト処理
                  while(Navigator.canPop(context)){
                    Navigator.pop(context);
                  }
                  Navigator.pushReplacement(context, MaterialPageRoute(
                      builder: (context) => LoginPage()
                  )); // ログイン画面に遷移
                },
              ),
            ],
          ),
        ),
        body: ListView.builder(
          itemCount: postList.length,
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                  border: index == 0
                      ? Border(
                    top: BorderSide(color: Colors.grey[600]!, width: 1),
                    bottom: BorderSide(color: Colors.grey[600]!, width: 1),
                  )
                      : Border(
                    bottom: BorderSide(color: Colors.grey[600]!, width: 1),
                  )),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 22,
                    foregroundImage: NetworkImage(myAccount.imagePath),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  myAccount.name,
                                  style: const TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  '@flutter_0000',
                                  style: const TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                            Text(DateFormat('yy/MM/dd HH:mm')
                                .format(postList[index].createdTime!)),
                          ],
                        ),
                        Text(postList[index].content),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const PostPage(),
            ));
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
