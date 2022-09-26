import 'package:flutter/material.dart';
import 'package:learn_flutter/douban/model/home_model.dart';
import 'package:learn_flutter/douban/pages/home/home_movie_item.dart';
import 'package:learn_flutter/service/home_request.dart';

class MSHomeContent extends StatefulWidget {
  const MSHomeContent({Key? key}) : super(key: key);

  @override
  State<MSHomeContent> createState() => _MSHomeContentState();
}

class _MSHomeContentState extends State<MSHomeContent> {
  List<MSHomeMoviceModelItem> dataList = [];

  @override
  void initState() {
    super.initState();

    HomeRequest.requestMovieList(1).then((value) {
      var rank = dataList.length;
      for (int i = 0; i < value.length; i++) {
        rank += 1;
        value[i].rank = rank;
      }
      setState(() {
        dataList = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: dataList.length,
        itemBuilder: (ctx, index) {
          final item = dataList[index];
          return MSHomeMovieItem(item);
        });
  }
}
