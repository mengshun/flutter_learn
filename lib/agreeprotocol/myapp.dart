import 'package:flutter/material.dart';

import '../counter/counter.dart';

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyAppPage(),
      routes: {
        '/counter': (context) => MyCounterController("你好呀!"),
      },
    );
  }
}

class MyAppPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("商品列表"),
      ),
      body: MyAppHomeContent(),
    );
  }
}

class MyAppHomeContent extends StatelessWidget {
  const MyAppHomeContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, "/counter");
          },
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(color: Colors.lightBlueAccent),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "跳转计时器",
                  style: TextStyle(fontSize: 25),
                ),
              ],
            ),
          ),
        ),
        HomeProductItem("apple1", "Macbook1",
            "https://tva1.sinaimg.cn/large/006y8mN6gy1g72j6nk1d4j30u00k0n0j.jpg"),
        SizedBox(
          height: 8,
        ),
        HomeProductItem("apple2", "Macbook2",
            "https://tva1.sinaimg.cn/large/006y8mN6gy1g72imm9u5zj30u00k0adf.jpg"),
        SizedBox(
          height: 8,
        ),
        HomeProductItem("apple3", "Macbook3",
            "https://tva1.sinaimg.cn/large/006y8mN6gy1g72imqlouhj30u00k00v0.jpg")
      ],
    );
  }
}

class HomeProductItem extends StatelessWidget {
  final String title;
  final String desc;
  final String imageUrl;

  const HomeProductItem(this.title, this.desc, this.imageUrl);

  final style1 = const TextStyle(fontSize: 25, color: Colors.orange);
  final style2 = const TextStyle(fontSize: 20, color: Colors.greenAccent);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration:
          BoxDecoration(border: Border.all(width: 5, color: Colors.pink)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              print("点击了 $title");
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: style1,
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                desc,
                style: style2,
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Image.network(imageUrl)
        ],
      ),
    );
  }
}
