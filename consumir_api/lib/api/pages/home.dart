import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Home();
  }
}

class _Home extends State<Home> {
  String clave = "";
  late String url =
      "https://images.wallpapersden.com/image/download/poster-of-avengers-endgame-movie_a2htaGWUmZqaraWkpJRmZW1lrWdpZWU.jpg";
  bool? isActive = false;
  void onChanged1(bool? value) {
    setState(() {
      isActive = value;
      clave = value.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.black, child: url == null ? CircularProgressIndicator(): Image.network(url), width: 1080, height: 2400,);
  }
}
