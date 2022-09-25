import 'dart:math';

import 'package:flutter/material.dart';

class GridController extends StatelessWidget {
  const GridController({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Grid练习"),
        ),
        body: GridViewDemo2());
  }
}

class GridViewDemo2 extends StatelessWidget {
  const GridViewDemo2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: GridView(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200, mainAxisSpacing: 8, crossAxisSpacing: 8),
        children: List.generate(100, (index) {
          return Container(
            color: Color.fromARGB(Random().nextInt(256), Random().nextInt(256),
                Random().nextInt(256), Random().nextInt(256)),
            child: Center(child: Text("index $index")),
          );
        }),
      ),
    );
  }
}

class GridViewDemo1 extends StatelessWidget {
  const GridViewDemo1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.8,
        ),
        children: List.generate(100, (index) {
          return Container(
            color: Color.fromARGB(Random().nextInt(256), Random().nextInt(256),
                Random().nextInt(256), Random().nextInt(256)),
            child: Center(child: Text("index $index")),
          );
        }),
      ),
    );
  }
}
