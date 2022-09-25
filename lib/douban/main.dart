import 'package:flutter/material.dart';

import 'pages/main/main.dart';
import 'widgets/dashed_line.dart';
import 'widgets/star_rating.dart';

void main() => runApp(DoubanApp());

class DoubanApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "豆瓣App",
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primarySwatch: Colors.green,
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
      ),
      home: DoubanAppHomePage(),
    );
  }
}

class DoubanAppHomePage extends StatelessWidget {
  const DoubanAppHomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MSMainPage(),
    );
  }
}
