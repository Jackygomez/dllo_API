import 'package:consumir_api/api/controller/character.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;

var character;

class ListaPersonajes extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ListaPersonajes();
  }
}

class _ListaPersonajes extends State<ListaPersonajes> {
  List<dynamic> personaje = [];

  Future<void> obtenerPersonaje() async {
    const url =
        'https://gateway.marvel.com:443/v1/public/characters?ts=2000&apikey=bd85ca0e2e42ccba38de40d9f2efa7ea&hash=d16b26d4add5cf2eb2745c1bca283dbd&limit=30&offset=90';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      setState(() {
        personaje = jsonData['data']['results'];
      });
    } else {
      throw Exception('Failed to load characters');
    }
  }

  @override
  void initState() {
    super.initState();
    obtenerPersonaje();
  }

  @override
  Widget build(BuildContext context) {

    return Container(
        child: Center(
      child: personaje.isEmpty
          ? CircularProgressIndicator()
          : ListView.separated(
              itemCount: personaje.length,
              separatorBuilder: (context, index) => Divider(color: Colors.red),
              itemBuilder: (context, index) {
                final name = personaje[index]['name'];
                final image = personaje[index]['thumbnail']['path'] +
                    '.' +
                    personaje[index]['thumbnail']['extension'];
                final description = personaje[index]['description'];
                final comics = personaje[index]['comics']['available'];
                final series = personaje[index]['series']['available'];
                final stories = personaje[index]['stories']['available'];
                final events = personaje[index]['events']['available'];
                late dynamic tres_primeras_series = personaje[index]['series']
                        ['items']
                    .take(3)
                    .map((e) => e['name'])
                    .toString();
                return ListTile(
                  leading: Image.network(
                    image,
                    width: 50,
                    height: 50,
                  ),
                  trailing: Icon(Icons.arrow_right),
                  title: Text(name),
                  onTap: () {
                    Character(name, image, description, comics, series, stories,
                        events, tres_primeras_series);
                    Navigator.pushNamed(
                        context, 'detail_character', arguments: Character(name, image, description, comics, series, stories, events, tres_primeras_series)
                        );
                  },
                );
              }),
    ));
  }
}
