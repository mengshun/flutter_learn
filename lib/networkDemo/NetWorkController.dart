import 'package:flutter/material.dart';
import 'package:learn_flutter/service/http_request.dart';

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

class NetworkCotent extends StatefulWidget {
  const NetworkCotent({
    Key? key,
  }) : super(key: key);

  @override
  State<NetworkCotent> createState() => _NetworkCotentState();
}

class _NetworkCotentState extends State<NetworkCotent> {
  @override
  void initState() {
    super.initState();

    HttpRequest.request<Map<String, dynamic>>("/get", params: {"a": "b"})
        .then((value) {
      print("res1: $value");
    });

    HttpRequest.request<Map<String, dynamic>>("/post",
        method: "post", params: {"c": "d"}).then((value) {
      print("res2: $value");
    }).catchError((e) {
      print("res2 error: $e");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text("测试内容");
  }
}
