import 'package:flutter/material.dart';

class ImageDetailController extends StatelessWidget {
  const ImageDetailController(this._imageUrl, {Key? key}) : super(key: key);

  final String _imageUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Hero(
            tag: _imageUrl,
            child: Image.network(_imageUrl),
          ),
        ),
      ),
    );
  }
}
