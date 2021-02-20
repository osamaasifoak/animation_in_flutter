import 'package:animation/components/text_component.dart';
import 'package:animation/constants/colors/colors_constants.dart';
import 'package:animation/constants/strings/string_constants.dart';
import 'package:animation/constants/styles/font_styles_constants.dart';
import 'package:animation/screens/built_in_implicit_and_explicit_animation.dart';
import 'package:flutter/material.dart';

class SongDetailScreen extends StatelessWidget {
  final String songTitle, songImage;

  const SongDetailScreen({Key key, this.songTitle, this.songImage})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.topLeft,
              children: [
                Hero(
                  tag: songTitle,
                  child: Container(
                    height: _height / 2,
                    decoration: new BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(songImage), fit: BoxFit.cover),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 52.0, left: 12),
                    child: CircleAvatar(
                      backgroundColor: ColorConstant.greyishBrownThree,
                      child: Icon(
                        Icons.arrow_back,
                        size: 20,
                        color: ColorConstant.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 25),
              child: TextComponent(
                text: songTitle,
                textStyle: FontStyles.inter(
                    color: ColorConstant.greyishBrownThree,
                    fontSize: 35,
                    fontWeight: FontWeight.w800),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 25),
              child: TextComponent(
                text: StringConstant.lyrics,
                textStyle: FontStyles.inter(
                    color: ColorConstant.greyishBrownThree,
                    fontSize: 18,
                    fontWeight: FontWeight.w800),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 10),
              child: TextComponent(
                text: StringConstant.dummyText,
                textStyle: FontStyles.inter(
                    color: ColorConstant.greyishBrownThree,
                    fontSize: 16,
                    fontWeight: FontWeight.w300),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BuiltInImplicitAndExplicitAnimation(
                songImage: songImage,
                songTitle: songTitle,
              ),
            ),
          )
        },
        child: Icon(Icons.play_arrow),
        backgroundColor: ColorConstant.greyishBrownThree,
      ),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
    );
  }
}
