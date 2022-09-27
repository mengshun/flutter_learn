import 'dart:math';

import 'package:flutter/material.dart';
import 'package:learn_flutter/03_animation/modal_page.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MSHomePage(),
    );
  }
}

class MSHomePage extends StatefulWidget {
  const MSHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MSHomePage> createState() => _MSHomePageState();
}

class _MSHomePageState extends State<MSHomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _sizeAnimation;
  late Animation _colorAniamtion;
  late Animation _alphaAnimation;
  late Animation _rotationAnimation;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 5000),
    );
    var animation =
    CurvedAnimation(parent: _controller, curve: Curves.easeInOut);

    _sizeAnimation = Tween(begin: 50.0, end: 150.0).animate(animation);
    _colorAniamtion = ColorTween(
      begin: Colors.red,
      end: Colors.green,
    ).animate(animation);
    _alphaAnimation = Tween(begin: 0.0, end: 1.0).animate(animation);
    _rotationAnimation = Tween(begin: 0.0, end: pi * 2).animate(_controller);
    // _controller.addListener(() {
    //   setState(() {});
    // });
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.dismissed) {
        _controller.forward();
      } else if (status == AnimationStatus.completed) {
        _controller.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    print("======build=====");
    return Scaffold(
      appBar: AppBar(
        title: Text("动画练习"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  // // present
                  // Navigator.of(context).push(
                  //   MaterialPageRoute(
                  //     builder: (ctx) {
                  //       return ModalPageController();
                  //     },
                  //     fullscreenDialog: true,
                  //   ),
                  // );

                  // 渐变转场
                  Navigator.of(context).push(PageRouteBuilder(
                    pageBuilder: (context, animation1, animation2) {
                      return FadeTransition(
                        opacity: animation1,
                        child: ModalPageController(),
                      );
                    },
                    transitionDuration: Duration(seconds: 3),
                  ));
                },
                child: Text("跳转")),
            AnimatedBuilder(
              builder: (context, child) {
                return Transform(
                  transform: Matrix4.rotationZ(_rotationAnimation.value),
                  alignment: Alignment.center,
                  child: Opacity(
                    opacity: _alphaAnimation.value,
                    child: Container(
                      width: _sizeAnimation.value,
                      height: _sizeAnimation.value,
                      color: _colorAniamtion.value,
                    ),
                  ),
                );
              },
              animation: _controller,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_controller.isAnimating) {
            _controller.stop();
          } else if (_controller.status == AnimationStatus.reverse) {
            _controller.reverse();
          } else {
            _controller.forward();
          }

          // if (_sizeAnimation.value > 100) {
          //   _controller.reverse();
          // } else {
          //   _controller.forward();
          // }
        },
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}

class AnimatedIcon extends AnimatedWidget {
  const AnimatedIcon(Animation sizeAnimation, {
    Key? key,
  }) : super(key: key, listenable: sizeAnimation);

  @override
  Widget build(BuildContext context) {
    Animation animation = listenable as Animation;
    return Icon(
      Icons.favorite,
      color: Colors.red,
      size: animation.value,
    );
  }
}
