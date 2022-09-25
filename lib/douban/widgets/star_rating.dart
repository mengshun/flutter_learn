// 星级 评分
import 'package:flutter/material.dart';

class MSStarRating extends StatefulWidget {
  MSStarRating({
    Key? key,
    required this.rating,
    this.maxRating = 10,
    this.count = 5,
    this.size = 30,
    this.unselectedColor = const Color(0xffbbbbbb),
    this.selectedColor = const Color(0xffff0000),
    Widget? unselectedImage,
    Widget? selectedImage,
  })  : _unselectedImage = unselectedImage ??
            Icon(
              Icons.star_border,
              color: unselectedColor,
              size: size,
            ),
        _selectedImage = selectedImage ??
            Icon(
              Icons.star,
              color: selectedColor,
              size: size,
            ),
        super(key: key);

  final double rating; // 当前评分
  final double maxRating; // 满评分
  final int count; // 星星个数
  final double size; // 星星大小
  final Color unselectedColor; // 未选中颜色
  final Color selectedColor; // 选中颜色
  final Widget _unselectedImage;
  final Widget _selectedImage;

  @override
  State<MSStarRating> createState() => _MSStarRatingState();
}

class _MSStarRatingState extends State<MSStarRating> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: buildUnselectStar(),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: buildSelectStar(),
        )
      ],
    );
  }

  List<Widget> buildUnselectStar() {
    return List.generate(widget.count, (index) {
      return widget._unselectedImage;
    });
  }

  List<Widget> buildSelectStar() {
    List<Widget> stars = [];

    final star = widget._selectedImage;

    double oneValue = widget.maxRating / widget.count;
    int entireCount = (widget.rating / oneValue).floor();
    stars.addAll(List.generate(entireCount, (index) => star));

    double leftWidth = ((widget.rating / oneValue) - entireCount) * widget.size;
    final halfStar = ClipRect(
      child: star,
      clipper: MSStarClipper(leftWidth),
    );
    stars.add(halfStar);
    if (stars.length > widget.count) {
      return stars.sublist(0, widget.count);
    }
    return stars;
  }
}

class MSStarClipper extends CustomClipper<Rect> {
  final double width;

  const MSStarClipper(this.width);

  @override
  Rect getClip(Size size) {
    return Rect.fromLTRB(0, 0, width, size.height);
  }

  @override
  bool shouldReclip(MSStarClipper oldClipper) {
    return oldClipper.width != width;
  }
}
