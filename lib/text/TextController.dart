import 'package:flutter/material.dart';

class TextController extends StatelessWidget {
  const TextController({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("基础Widget"),
      ),
      body: TextContent(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("floating action");
        },
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class TextContent extends StatefulWidget {
  const TextContent({Key? key}) : super(key: key);

  @override
  State<TextContent> createState() => _TextContentState();
}

class _TextContentState extends State<TextContent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextDemo(),
        RichTextDemo(),
        ButtonDemoWidget(),
        FloatingActionButton(
            child: Text("FloatingActionButton"),
            backgroundColor: Colors.black38,
            onPressed: () {
              print("FloatingActionButton action");
            }),
        OutlinedButton(
            onPressed: () {
              print("OutlinedButton action");
            },
            child: Text("OutlinedButton")),
        CustomButtonWidget()
      ],
    );
  }
}

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          print("TextButton click");
        },
        style: TextButton.styleFrom(
            backgroundColor: Colors.orange,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15))),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.favorite,
              color: Colors.red,
            ),
            Text("喜欢作者")
          ],
        ));
  }
}

class ButtonDemoWidget extends StatelessWidget {
  const ButtonDemoWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          print("Button1 clicked");
        },
        style: ElevatedButton.styleFrom(backgroundColor: Colors.black38),
        child: const Text(
          "Button1",
          style: TextStyle(color: Colors.white, backgroundColor: Colors.red),
        ));
  }
}

class RichTextDemo extends StatelessWidget {
  const RichTextDemo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text.rich(TextSpan(children: [
      TextSpan(
          text: "Hello world!",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      TextSpan(
          text: "Hello world!",
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.red)),
      WidgetSpan(
          child: Icon(
        Icons.favorite,
        color: Colors.red,
      )),
      TextSpan(
          text: "Hello world!",
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.greenAccent)),
    ]));
  }
}

class TextDemo extends StatelessWidget {
  const TextDemo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      "《定风波》 苏轼 莫听穿林打叶声，何妨吟啸且徐行。竹杖芒鞋轻胜马，谁怕？一蓑烟雨任平生。",
      textAlign: TextAlign.center,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: 20,
        color: Colors.red,
        fontWeight: FontWeight.bold,
        // letterSpacing: 10,
        // wordSpacing: 10
      ),
    );
  }
}
