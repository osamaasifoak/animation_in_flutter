import 'package:animation/components/text_component.dart';
import 'package:animation/constants/colors/colors_constants.dart';
import 'package:animation/constants/styles/font_styles_constants.dart';
import 'package:flutter/material.dart';

class BuiltInImplicitAndExplicitAnimation extends StatefulWidget {
  final String songImage, songTitle;

  const BuiltInImplicitAndExplicitAnimation(
      {Key key, this.songImage, this.songTitle})
      : super(key: key);
  @override
  _BuiltInImplicitAndExplicitAnimationState createState() =>
      _BuiltInImplicitAndExplicitAnimationState();
}

class _BuiltInImplicitAndExplicitAnimationState
    extends State<BuiltInImplicitAndExplicitAnimation>
    with TickerProviderStateMixin {
  AnimationController _animationController;
  bool _playState = false;
  @override
  void initState() {
    super.initState();
    _animationController = new AnimationController(
      duration: Duration(seconds: 10),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        width: _width,
        height: _height,
        color: ColorConstant.greyishBrownTwo,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: widget.songTitle,
              child: RotationTransition(
                turns: _animationController,
                child: _circleImage(_width, _height),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 50),
              child: SlideTransition(
                position: Tween<Offset>(
                        begin: Offset(_animationController.value * 2, 0),
                        end: Offset(_animationController.value * -1.1, 0))
                    .animate(_animationController),
                child: TextComponent(
                  text: widget.songTitle,
                  textStyle: FontStyles.inter(
                      color: ColorConstant.whiteBody,
                      fontSize: 25,
                      fontWeight: FontWeight.w800),
                ),
              ),
            ),
            _actionBtn()
          ],
        ),
      ),
    );
  }

  Row _actionBtn() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.skip_previous,
          size: 80,
        ),
        InkWell(
          onTap: () {
            setState(() {
              if (_animationController.isAnimating) {
                _animationController.stop();
                _playState = false;
              } else {
                _animationController.repeat();
                _playState = true;
              }
            });
          },
          child: AnimatedCrossFade(
            duration: Duration(milliseconds: 400),
            firstChild: Icon(Icons.play_arrow, size: 100),
            secondChild: Icon(
              Icons.pause,
              size: 100,
            ),
            crossFadeState: !_playState
                ? CrossFadeState.showFirst
                : CrossFadeState.showSecond,
          ),
        ),
        Icon(
          Icons.skip_next,
          size: 80,
        )
      ],
    );
  }

  Stack _circleImage(double _width, double _height) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          decoration: new BoxDecoration(boxShadow: [
            BoxShadow(
                blurRadius: 5,
                spreadRadius: 5,
                color: Colors.black.withOpacity(0.3)),
          ], shape: BoxShape.circle, color: ColorConstant.greyishBrownThree),
          child: CircleAvatar(
            backgroundImage: NetworkImage(widget.songImage),
            radius: _width / 3,
          ),
        ),
      ],
    );
  }
}
