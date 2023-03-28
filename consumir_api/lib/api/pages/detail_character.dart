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
      ),
      body: Center(
        child: Column(
          children: [
            _roundedImage(args.image),
            Text(args.description),
            Text(""),
            Text("Cantidad de Comics: $comics", textAlign: TextAlign.center),
            Text(""),
            Text("Cantidad de Series: $series"),
            Text(""),
            Text("Cantidad de stories: $stories"),
            Text(""),
            Text("Cantidad de events: $events"),
            Text(""),
            Text("Nombre de las 3 primeras series: $tres_primeras_series", textAlign: TextAlign.center)
          ],
        ),
      ),
    );
  }
}

Widget _roundedImage(image) {
  return Container(
    margin: const EdgeInsets.only(top: 30, bottom: 20, right: 10, left: 10), 
  child:ClipRRect(
    borderRadius: BorderRadius.circular(30.0),
    child: Image.network(image),
  ));
}