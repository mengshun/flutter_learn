import 'package:flutter/material.dart';

class MyCounterController extends StatefulWidget {
  final String message;

  const MyCounterController(this.message);

  @override
  State<MyCounterController> createState() => _MyCounterControllerState();
}

class _MyCounterControllerState extends State<MyCounterController> {
  var currentCounter = 0;

  @override
  void initState() {
    print("_MyCounterControllerState initState");
    super.initState();
  }

  @override
  void dispose() {
    print("_MyCounterControllerState dispose");
    super.dispose();
  }

  @override
  // TODO: implement mounted
  bool get mounted {
    print("mounted ${super.mounted}");
    return super.mounted;
  }

  @override
  void didChangeDependencies() {
    print("_MyCounterControllerState didChangeDependencies");
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant MyCounterController oldWidget) {
    print("_MyCounterControllerState didUpdateWidget");
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    print("_MyCounterControllerState build");
    return Scaffold(
      appBar: AppBar(
        title: Text("计数器"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      print("object ==== ${this.widget.hashCode}");
                      setState(() {
                        currentCounter--;
                      });
                    },
                    child: Text(
                      "-",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    )),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        currentCounter++;
                      });
                    },
                    child: Text(
                      "+",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    )),
              ],
            ),
            Text(
              "当前计数: $currentCounter",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 10,
            ),
            Text("传入的msg: ${this.widget.message}")
          ],
        ),
      ),
    );
  }
}
