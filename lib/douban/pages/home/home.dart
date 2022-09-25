import 'package:flutter/material.dart';
import 'package:learn_flutter/douban/pages/home/home_content.dart';

class MSHomePage extends StatelessWidget {
  const MSHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("首页"),
      ),
      body: MSHomeContent(),
    );
  }
}
