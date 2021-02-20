import 'package:flutter/cupertino.dart';

class PlayListModel {
  String name;
  String image;
  bool isFavourite;

  PlayListModel(
      {@required this.name, @required this.image, @required this.isFavourite});
}
