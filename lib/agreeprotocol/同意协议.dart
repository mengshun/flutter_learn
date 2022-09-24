import 'package:flutter/material.dart';

class MSHomeBody extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MSHomeBodyState();
  }
}

class _MSHomeBodyState extends State<MSHomeBody> {
  var flag = false;

  changed(bool? value) {
    if (value == null) return;
    setState(() {
      flag = value!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Checkbox(
              value: flag,
              onChanged: changed),
          Text('同意协议'),
          // Text(DateTime.now().toString())
        ],
      ),
    );
  }
}
