import 'package:flutter/material.dart';

class NetworkController extends StatelessWidget {
  const NetworkController({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("网络列表练习"),
      ),
      body: NetworkCotent(),
    );
  }
}

class NetworkCotent extends StatelessWidget {
  const NetworkCotent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text("测试内容");
  }
}
