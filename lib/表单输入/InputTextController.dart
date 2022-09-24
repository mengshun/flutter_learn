import 'package:flutter/material.dart';

class InputTextController extends StatelessWidget {
  const InputTextController({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("表单输入"),
      ),
      body: InputTextContent(),
    );
  }
}

class InputTextContent extends StatefulWidget {
  const InputTextContent({Key? key}) : super(key: key);

  @override
  State<InputTextContent> createState() => _InputTextContentState();
}

class _InputTextContentState extends State<InputTextContent> {
  @override
  Widget build(BuildContext context) {
    return TextDemoWidget();
  }
}

class TextDemoWidget extends StatelessWidget {
  final userNameTextEditController = TextEditingController();
  final passwordTextEditController = TextEditingController();
  final uaFocus = FocusNode();
  final psFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        primaryColor: Colors.red,
        backgroundColor: Colors.green,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              focusNode: uaFocus,
              controller: userNameTextEditController,
              decoration: InputDecoration(
                // labelText: "userName",
                icon: Icon(Icons.people),
                hintText: "请输入用户名",
                border: OutlineInputBorder(),
                fillColor: Colors.red[100],
                filled: true,
              ),
              onChanged: (value) {
                print("onChanged $value");
              },
              onSubmitted: (value) {
                print("onSubmitted $value");
              },
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              focusNode: psFocus,
              controller: passwordTextEditController,
              decoration: InputDecoration(
                  // labelText: "password",
                  hintText: "请输入密码",
                  icon: Icon(Icons.lock),
                  border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              height: 44,
              child: TextButton(
                  onPressed: () {
                    uaFocus.unfocus();
                    psFocus.unfocus();
                    print(
                        "登录 action ${userNameTextEditController.text} ${passwordTextEditController.text}");
                  },
                  style: TextButton.styleFrom(backgroundColor: Colors.blue),
                  child: Text(
                    "登 录",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
