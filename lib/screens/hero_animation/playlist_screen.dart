import 'package:animation/components/text_component.dart';
import 'package:animation/constants/colors/colors_constants.dart';
import 'package:animation/constants/styles/font_styles_constants.dart';
import 'package:animation/model/playlist_model.dart';
import 'package:animation/screens/hero_animation/song_detail_screen.dart';
import 'package:flutter/material.dart';

class PlayListScreen extends StatelessWidget {
  final List<PlayListModel> _playList = [
    PlayListModel(
        name: "Blinded lights by the weeknd",
        image: "https://i.ytimg.com/vi/fHI8X4OXluQ/mqdefault.jpg",
        isFavourite: false),
    PlayListModel(
        name: "Luis Fonsi - Despacito ft. Daddy Yankee",
        image:
            "https://edm.com/.image/ar_16:9%2Cc_fill%2Ccs_srgb%2Cfl_progressive%2Cg_faces:center%2Cq_auto:good%2Cw_768/MTU0ODA2NjI0MTI3NTU5MDM0/luis-fonsi-daddy-yankee.jpg",
        isFavourite: false),
    PlayListModel(
        name: "Not Afraid",
        image:
            "https://static01.nyt.com/images/2020/01/19/reader-center/19exp-eminem/17xp-eminem-mobileMasterAt3x.jpg",
        isFavourite: false),
    PlayListModel(
        name: "Love the way you lie",
        image: "https://pbs.twimg.com/media/DXJ8VJiW4AAop-E.jpg",
        isFavourite: false),
    PlayListModel(
        name: "Call out my name",
        image: "https://i.ytimg.com/vi/M4ZoCHID9GI/maxresdefault.jpg",
        isFavourite: false),
    PlayListModel(
        name: "Gnash - i hate u, i love u ft. olivia o'brien",
        image: "https://i.ytimg.com/vi/BiQIc7fG9pA/maxresdefault.jpg",
        isFavourite: false),
  ];
  @override
  Widget build(BuildContext context) {
    final double _height = MediaQuery.of(context).size.height;
    final double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: _height,
        width: _width,
        color: ColorConstant.greyishBrownTwo,
        child: Padding(
          padding: const EdgeInsets.only(top: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 18, top: 25),
                child: TextComponent(
                  text: "Playlist",
                  textStyle: FontStyles.inter(
                      color: ColorConstant.greyishBrownThree,
                      fontSize: 45,
                      fontWeight: FontWeight.w800),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: _playList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: _ListCard(
                        listItem: _playList,
                        index: index,
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _ListCard extends StatefulWidget {
  const _ListCard({
    Key key,
    @required this.listItem,
    this.index,
  }) : super(key: key);

  final List<PlayListModel> listItem;
  final int index;
  @override
  __ListCardState createState() => __ListCardState();
}

class __ListCardState extends State<_ListCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SongDetailScreen(
              songImage: widget.listItem[widget.index].image,
              songTitle: widget.listItem[widget.index].name,
            ),
          ),
        );
      },
      child: ListTile(
        leading: Hero(
          tag: widget.listItem[widget.index].name,
          child: Container(
            width: 50,
            height: 50,
            decoration: new BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: NetworkImage(
                    widget.listItem[widget.index].image,
                  ),
                  fit: BoxFit.cover),
            ),
          ),
        ),
        title: Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: TextComponent(
            text: widget.listItem[widget.index].name,
            textStyle: FontStyles.inter(
                color: ColorConstant.white,
                fontSize: 16,
                fontWeight: FontWeight.w400),
          ),
        ),
        trailing: InkWell(
          onTap: () {
            setState(() {
              if (widget.listItem[widget.index].isFavourite)
                widget.listItem[widget.index].isFavourite = false;
              else
                widget.listItem[widget.index].isFavourite = true;
            });
          },
          child: AnimatedCrossFade(
            duration: Duration(milliseconds: 500),
            secondChild: Icon(
              Icons.favorite,
              size: 20,
            ),
            firstChild: Icon(
              Icons.favorite,
              color: Colors.red,
              size: 25,
            ),
            crossFadeState: widget.listItem[widget.index].isFavourite
                ? CrossFadeState.showFirst
                : CrossFadeState.showSecond,
          ),
        ),
      ),
    );
  }
}
