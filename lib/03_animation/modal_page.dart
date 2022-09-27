import 'dart:math';

import 'package:flutter/material.dart';
import 'package:learn_flutter/03_animation/image_detail.dart';

class ModalPageController extends StatelessWidget {
  const ModalPageController({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("列表练习"),
      ),
      body: GridViewListPage(),
      // backgroundColor: Colors.red,
    );
  }
}

class GridViewListPage extends StatelessWidget {
  const GridViewListPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 0.8,
      ),
      children: List.generate(20, (index) {
        final url = "https://api.yimian.xyz/img?display=300x300&a=$index";
        return GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              PageRouteBuilder(pageBuilder: (context, animation1, aniamtion2) {
                return FadeTransition(
                  opacity: animation1,
                  child: ImageDetailController(url),
                );
              }),
            );
          },
          child: Hero(
            tag: url,
            child: Image.network(
              url,
              fit: BoxFit.cover,
            ),
          ),
        );
      }),
    );
  }
}
