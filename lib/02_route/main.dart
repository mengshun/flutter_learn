import 'package:flutter/material.dart';
import 'package:learn_flutter/02_route/detail.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        MyHomePage.routeName: (ctx) => MyHomePage(),
        DetailController.routeName: (ctx) => const DetailController(),
      },
      initialRoute: MyHomePage.routeName,
    );
  }
}

class MyHomePage extends StatelessWidget {
  static const String routeName = "/";

  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("手势练习"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PushDetailBtn(),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(onPressed: () {}, child: Text("跳转list")),
          ],
        ),
      ),
    );
  }
}

class PushDetailBtn extends StatelessWidget {
  const PushDetailBtn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          Navigator.of(context)
              .pushNamed(DetailController.routeName, arguments: {"a": "b"});
          // Navigator.of(context)
          //     .push(MaterialPageRoute(builder: (context) => DetailController()))
          //     .then((value) {
          //   print("回调的数据 $value");
          // });
        },
        child: Text("跳转详情"));
  }
}
