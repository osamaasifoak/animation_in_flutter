import 'package:flutter/material.dart';

class CustomExplicitAnimation extends StatefulWidget {
  @override
  _CustomExplicitAnimationState createState() =>
      _CustomExplicitAnimationState();
}

class _CustomExplicitAnimationState extends State<CustomExplicitAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  @override
  void initState() {
    super.initState();
    _animationController = new AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.network(
          "https://pngimage.net/wp-content/uploads/2018/06/iron-man-3-png-1.png",
          height: 500,
        ),
        AnimatedBuilder(
          animation: _animationController,
          builder: (context, child) {
            return Container(
              decoration: new BoxDecoration(
                gradient: RadialGradient(
                  colors: [
                    Colors.blueAccent.withOpacity(0.6),
                    Colors.blue[50].withOpacity(0.2)
                  ],
                  radius: 2,
                  stops: [0, _animationController.value],
                ),
              ),
            );
          },
        )
      ],
    );
  }
}
