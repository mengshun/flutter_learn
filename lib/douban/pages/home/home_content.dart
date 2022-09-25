import 'package:flutter/material.dart';

class MSHomeContent extends StatefulWidget {
  const MSHomeContent({Key? key}) : super(key: key);

  @override
  State<MSHomeContent> createState() => _MSHomeContentState();
}

class _MSHomeContentState extends State<MSHomeContent> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("这是首页压"),
    );
  }
}
