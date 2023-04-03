import 'dart:math';

import 'package:flutter/material.dart';

import '../controller/character.dart';

class DetailCharacter extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DetailCharacter();
  }
}

class _DetailCharacter extends State<DetailCharacter> {
  @override
  Widget build(BuildContext context) {
    Character args = ModalRoute.of(context)?.settings.arguments as Character;

    int comics = args.comics;
    int series = args.series;
    int stories = args.stories;
    int events = args.events;
    dynamic tres_primeras_series = args.tres_primeras_series;

    return Scaffold(
      appBar: AppBar(
        title: Text(args.name),
        backgroundColor: Colors.purple,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            _roundedImage(args.image),
            Text(args.description),
            Text(""),
            Container(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(Icons.auto_stories),
                Icon(Icons.movie),
                Icon(Icons.history_edu),
                Icon(Icons.event)
              ],
            )),
            Text(""),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Comics: $comics"),
                  Text("Series: $series"),
                  Text("Stories: $stories"),
                  Text("Events: $events"),
                ],
              ),
            ),
            Text(""),
            Text(""),
            Container(
              child: Center(
                child: Column(children: [
                  Text("Tres Primeras Series", style: TextStyle(fontSize: 20)),
                  Text(""),
                  Text(tres_primeras_series.toString())
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget _roundedImage(image) {
  return Container(
      margin: const EdgeInsets.only(top: 30, bottom: 20, right: 10, left: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30.0),
        child: Image.network(image),
      ));
}
