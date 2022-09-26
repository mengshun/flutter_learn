import 'package:flutter/material.dart';
import 'package:learn_flutter/douban/widgets/dashed_line.dart';

import '../../model/home_model.dart';
import '../../widgets/star_rating.dart';

class MSHomeMovieItem extends StatelessWidget {
  final MSHomeMoviceModelItem item;

  const MSHomeMovieItem(
    this.item, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color(0xffcccccc),
            width: 8,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildHeader(),
          SizedBox(
            height: 8,
          ),
          buildContent(),
          SizedBox(
            height: 8,
          ),
          buildFooter(),
        ],
      ),
    );
  }

  Widget buildHeader() {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 238, 205, 144),
        borderRadius: BorderRadius.circular(3),
      ),
      child: Text(
        "NO.${item.rank}",
        style: TextStyle(
          fontSize: 16,
          color: Color.fromARGB(255, 131, 95, 36),
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  Widget buildContent() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildContentImage(),
        SizedBox(
          width: 8,
        ),
        buildContentInfo(),
        SizedBox(
          width: 8,
        ),
        buildContentline(),
        SizedBox(
          width: 8,
        ),
        buildContentWish(),
      ],
    );
  }

  Widget buildContentImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.network(
        item.vod_pic,
        height: 150,
        width: 100,
        errorBuilder: (a, b, c) {
          return Container(
            height: 150,
            width: 100,
          );
        },
      ),
    );
  }

  Widget buildContentInfo() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildContentInfoTitle(),
          buildContentInfoRate(),
          buildContentInfoDesc(),
        ],
      ),
    );
  }

  Widget buildContentInfoTitle() {
    return Text.rich(
      TextSpan(
        children: [
          const WidgetSpan(
            child: Icon(
              Icons.play_circle_outline,
              color: Colors.redAccent,
              size: 34,
            ),
          ),
          TextSpan(
            text: item.vod_name,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: "(${item.vod_year})",
            style: const TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildContentInfoRate() {
    return Row(
      children: [
        MSStarRating(
          rating: item.vod_score,
          size: 20,
        ),
        SizedBox(width: 6),
        Text(
          "${item.vod_score}",
          style: TextStyle(
            fontSize: 16,
          ),
        )
      ],
    );
  }

  Widget buildContentInfoDesc() {
    return Text(
      "${item.vod_area} ${item.vod_class} ${item.vod_actor}",
      style: TextStyle(
        fontSize: 16,
      ),
      maxLines: 4,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget buildContentline() {
    return Container(
      height: 100,
      child: const MSDashedLine(
        axis: Axis.vertical,
        dashedWidth: .5,
        dashedHeight: 6,
        count: 10,
        color: Colors.pink,
      ),
    );
  }

  Widget buildContentWish() {
    return Container(
      height: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.favorite_border_outlined),
          Text("想看"),
        ],
      ),
    );
  }

  Widget buildFooter() {
    return Container(
      padding: const EdgeInsets.all(8),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xffe2e2e2),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(item.vod_blurb),
    );
  }
}
