import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';

final eventBus = EventBus();

class UserInfo {
  final String nickName;
  final int age;

  const UserInfo(this.nickName, this.age);
}

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("手势练习"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MSBtn(),
              MSText(),
            ],
          ),
        ),
      ),
    );
  }
}

class MSText extends StatefulWidget {
  const MSText({
    Key? key,
  }) : super(key: key);

  @override
  State<MSText> createState() => _MSTextState();
}

class _MSTextState extends State<MSText> {
  String _message = "初始文字";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    eventBus.on<UserInfo>().listen((event) {
      setState(() {
        _message = "${event.nickName} - ${event.age}";
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text(_message);
  }
}

class MSBtn extends StatelessWidget {
  const MSBtn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          eventBus.fire(UserInfo("顺子", 20));
        },
        child: Text("可以点击我"));
  }
}

class GestureDemo02 extends StatelessWidget {
  const GestureDemo02({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) {
        print("outer tap");
      },
      child: Container(
        width: 200,
        height: 200,
        color: Colors.red,
        alignment: Alignment.center,
        child: GestureDetector(
          onTapDown: (details) {
            print("inner tap");
          },
          child: Container(
            width: 100,
            height: 100,
            color: Colors.orange,
          ),
        ),
      ),
    );
  }
}

class GestureDemo extends StatelessWidget {
  const GestureDemo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("onTap");
      },
      onDoubleTap: () {
        print("onDoubleTap");
      },
      onTapCancel: () {
        print("onTapCancel");
      },
      onTapUp: (details) {
        print("onTapUp $details");
        print("ontap ${details.globalPosition}");
        print("ontap ${details.localPosition}");
      },
      onTapDown: (details) {
        print("onTapDown $details");
      },
      child: Container(
        width: 200,
        height: 200,
        color: Colors.red,
      ),
    );
  }
}

class ListenerDemo extends StatelessWidget {
  const ListenerDemo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (event) {
        print("指针按下: $event");
        print(event.position);
        print(event.localPosition);
      },
      onPointerMove: (event) {
        print("指针移动: $event");
      },
      onPointerUp: (event) {
        print("指针抬起: $event");
      },
      child: Container(
        width: 200,
        height: 200,
        color: Colors.red,
      ),
    );
  }
}
