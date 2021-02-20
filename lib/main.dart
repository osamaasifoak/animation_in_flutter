import 'package:animation/screens/custom_explicit_animation.dart';
import 'package:animation/screens/hero_animation/playlist_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animation in Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: PlayListScreen(),
      // home: CustomExplicitAnimation(),
    );
  }
}
