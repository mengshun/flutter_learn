import 'package:flutter/material.dart';

class DetailController extends StatelessWidget {
  static const String routeName = "/detail";

  const DetailController({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final initParams = ModalRoute.of(context)?.settings.arguments;
    print("initParams $initParams");
    return Scaffold(
      appBar: AppBar(
        title: Text("DetailController"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("DetailController"),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop("返回的数据");
              },
              child: Text("返回上一页"),
            ),
          ],
        ),
      ),
    );
  }
}
