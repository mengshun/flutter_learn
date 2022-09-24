import 'package:flutter/material.dart';

class LayoutController extends StatelessWidget {
  const LayoutController({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("布局组件"),
      ),
      body: LayoutContent(),
    );
  }
}

class LayoutContent extends StatelessWidget {
  const LayoutContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.red,
      width: 200,
      height: 200,
      alignment: Alignment(-1, -1),
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.all(10),
      // transform: Matrix4.rotationZ(50),
      decoration: BoxDecoration(
          color: Colors.red,
          border: Border.all(
            color: Colors.purple,
            width: 5,
          ),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.orange,
              offset: Offset(10, 10),
              blurRadius: 10,
            ),
            BoxShadow(
              color: Colors.blue,
              offset: Offset(-10, 10),
              blurRadius: 10,
            )
          ]),
      child: Icon(
        Icons.pets,
        size: 50,
        color: Colors.white,
      ),
    );
    return PaddingDemo();
    return AlignDemo();
  }
}

class PaddingDemo extends StatelessWidget {
  const PaddingDemo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Text(
            "你好呀!",
            style: TextStyle(fontSize: 30, backgroundColor: Colors.red),
          ),
        ),
        Text(
          "你好呀!",
          style: TextStyle(fontSize: 30, backgroundColor: Colors.red),
        ),
        Text(
          "你好呀!",
          style: TextStyle(fontSize: 30, backgroundColor: Colors.red),
        ),
      ],
    );
  }
}

class AlignDemo extends StatelessWidget {
  const AlignDemo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment(1, 1),
      widthFactor: 10,
      heightFactor: 10,
      child: Icon(
        Icons.pets,
        size: 50,
      ),
    );
  }
}
