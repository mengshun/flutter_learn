import 'package:flutter/material.dart';

class ListViewController extends StatelessWidget {
  const ListViewController({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("列表练习"),
      ),
      body: ListViewDemo3(),
    );
  }
}

// separated 方式懒加载构造ListView
class ListViewDemo3 extends StatelessWidget {
  const ListViewDemo3({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: ListView.separated(
          itemBuilder: (context, index) {
            return ListTile(
              leading: Icon(Icons.people),
              trailing: Icon(Icons.delete),
              title: Text("人物 separated ${index + 1}"),
              subtitle: Text("电话 133-3333-3333"),
            );
          },
          separatorBuilder: (context, index) {
            return Divider(
              color: Colors.red,
              height: 30,
              indent: 15,
              endIndent: 15,
              thickness: 10,
            );
          },
          itemCount: 50),
    );
  }
}

// 懒加载方式构造ListView
class ListViewDemo2 extends StatelessWidget {
  const ListViewDemo2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 100,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.people),
            trailing: Icon(Icons.delete),
            title: Text("人物序号 ${index + 1}"),
            subtitle: Text("电话 133-3333-3333"),
          );
        });
  }
}

class StackTestDemo extends StatefulWidget {
  @override
  State<StackTestDemo> createState() => _StackTestDemoState();
}

class _StackTestDemoState extends State<StackTestDemo> {
  final imageUrl =
      "https://tse3-mm.cn.bing.net/th/id/OIP-C.M5GI7bb98dc-wqFmCa-dkQHaE4?pid=ImgDet&rs=1";

  var flag = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image(
          image: NetworkImage(imageUrl),
          height: 200,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
                // height: 90,
                color: Color.fromARGB(100, 0, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        "进击的巨人",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          flag = !flag;
                          setState(() {});
                        },
                        icon: Icon(
                          Icons.favorite,
                          color: flag ? Colors.red : Colors.white,
                        )),
                  ],
                ))),
      ],
    );
  }
}

// 2. 通讯录范例
class ListViewPersonNumDemo extends StatelessWidget {
  const ListViewPersonNumDemo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      // reverse: true,
      // itemExtent: 200,
      children: List.generate(50, (index) {
        return ListTile(
          leading: Icon(Icons.people),
          trailing: Icon(Icons.delete),
          title: Text("人物 ${index + 1}"),
          subtitle: Text("电话 133-3333-3333"),
        );
      }),
    );
  }
}

// 1. 普通列表 + Flex 布局
class ListDemoContent extends StatelessWidget {
  const ListDemoContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    print("media size $size");
    return Container(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              width: 100,
              height: 60,
              color: Colors.red,
            ),
          ),
          Expanded(
            child: Container(
              width: 200,
              height: 100,
              color: Colors.green,
            ),
          ),
          Container(
            width: 90,
            height: 80,
            color: Colors.blue,
          ),
          Container(
            width: 50,
            height: 120,
            color: Colors.orange,
          ),
        ],
      ),
    );
  }
}
