import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SliverDemoController extends StatefulWidget {
  const SliverDemoController({Key? key}) : super(key: key);

  @override
  State<SliverDemoController> createState() => _SliverDemoControllerState();
}

class _SliverDemoControllerState extends State<SliverDemoController> {
  final _controller = ScrollController(initialScrollOffset: 300);
  var _canShowFloatingBtn = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _controller.addListener(() {
    //   setState(() {
    //     _canShowFloatingBtn = _controller.offset > 1000;
    //     print("Listener scroll ${_controller.offset}");
    //   });
    // });
    print("------1--------");
    runCalc();
    print("------2--------");
  }

  void runCalc() async {
    final result = await compute(calc, 100);
    print("result: $result");
  }

  static int calc(int count) {
    int total = 0;
    for (int i = 0; i <= count; i++) {
      total += i;
    }
    return total;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sliver练习"),
      ),
      body: NotificationListener(
        onNotification: (ScrollNotification noti) {
          if (noti is ScrollStartNotification) {
            print("开始滚动");
          } else if (noti is ScrollUpdateNotification) {
            print(
                "正在滚动 总高度 ${noti.metrics.maxScrollExtent} 当前位置 ${noti.metrics.pixels}");
            setState(() {
              _canShowFloatingBtn = noti.metrics.pixels > 1000;
            });
          } else if (noti is ScrollEndNotification) {
            print("结束滚动");
          } else {
            print("不能识别的滚动 ${noti.runtimeType}");
          }
          return true;
        },
        child: DEMO4(controller: _controller),
      ),
      floatingActionButton: _canShowFloatingBtn
          ? FloatingActionButton(
              child: Icon(Icons.arrow_upward),
              onPressed: () {
                _controller.animateTo(0,
                    duration: Duration(milliseconds: 0350),
                    curve: Curves.easeIn);
              },
            )
          : null,
    );
  }
}

class DEMO4 extends StatelessWidget {
  const DEMO4({
    Key? key,
    required ScrollController controller,
  })  : _controller = controller,
        super(key: key);

  final ScrollController _controller;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: _controller,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Icon(Icons.people),
          title: Text("联系人 ${index + 1}"),
        );
      },
      itemCount: 100,
    );
  }
}

class SliverDEMO2 extends StatelessWidget {
  const SliverDEMO2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: 200,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            title: Text("Sliver练习"),
            background: Image.asset(
              "assets/images/a.jpg",
              fit: BoxFit.cover,
            ),
          ),
        ),
        SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Container(
                  color: Color.fromARGB(
                      Random().nextInt(256),
                      Random().nextInt(256),
                      Random().nextInt(256),
                      Random().nextInt(256)),
                  child: Center(child: Text("index ${index + 1}")),
                );
              },
              childCount: 5,
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              childAspectRatio: 3,
            )),
        SliverList(
            delegate: SliverChildBuilderDelegate(
          (context, index) {
            return Column(
              children: [
                ListTile(
                  leading: Icon(Icons.people),
                  title: Text("联系人 ${index + 1}"),
                ),
                Divider(),
              ],
            );
          },
          childCount: 30,
        )),
      ],
    );
  }
}

class SliverDEMO1 extends StatelessWidget {
  const SliverDEMO1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverSafeArea(
          sliver: SliverPadding(
            padding: EdgeInsets.all(8),
            sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return Container(
                      color: Color.fromARGB(
                          Random().nextInt(256),
                          Random().nextInt(256),
                          Random().nextInt(256),
                          Random().nextInt(256)),
                      child: Center(child: Text("index ${index + 1}")),
                    );
                  },
                  childCount: 30,
                ),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: 1.5,
                )),
          ),
        )
      ],
    );
  }
}
