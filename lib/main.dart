import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn_flutter/agreeprotocol/%E5%90%8C%E6%84%8F%E5%8D%8F%E8%AE%AE.dart';
import 'package:learn_flutter/agreeprotocol/myapp.dart';

// main() => runApp(LearnApp());

main() => runApp(Myapp());

class LearnApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // debugShowCheckedModeBanner: false,
      home: MSHomePage(),
    );
  }
}

class MSHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '大首页',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.w400),
        ),
      ),
      body: MSHomeBody(),
    );
  }
}
