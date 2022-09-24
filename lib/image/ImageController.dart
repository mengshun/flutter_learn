import 'package:flutter/material.dart';

class ImageController extends StatelessWidget {
  const ImageController({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("图片Widget"),
      ),
      body: ImageContent(),
    );
  }
}

class ImageContent extends StatelessWidget {
  const ImageContent({Key? key}) : super(key: key);

  final imageUrl =
      "https://tse3-mm.cn.bing.net/th/id/OIP-C.M5GI7bb98dc-wqFmCa-dkQHaE4?pid=ImgDet&rs=1";
  final fengJingUrl =
      "https://ts1.cn.mm.bing.net/th/id/R-C.820d4d4a0b392b03fbd4d874aa5bdf95?rik=5thxacagxHR1kg&riu=http%3a%2f%2fpic.kuaizhan.com%2fg3%2f6a%2f4c%2f91b3-5fbf-4b92-b6db-348a7e1825a975&ehk=WdM81zj12Lbw5WvUnk%2bjJgfpOzgxwk%2fc5rTM4tHu398%3d&risl=&pid=ImgRaw&r=0";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ImageBaseWidget(imageUrl: imageUrl),
        ImageBaseWidget(imageUrl: fengJingUrl),
        Image(
          image: AssetImage("assets/images/a.jpg"),
          height: 200,
        ),
      ],
    );
  }
}

class ImageBaseWidget extends StatelessWidget {
  const ImageBaseWidget({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Image(
      image: NetworkImage(imageUrl),
      width: 200,
      height: 200,
      fit: BoxFit.fitWidth,
      alignment: Alignment(0, -1),
      color: Colors.green,
      colorBlendMode: BlendMode.colorBurn,
    );
  }
}
