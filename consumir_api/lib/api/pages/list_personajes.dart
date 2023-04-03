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
        'https://gateway.marvel.com:443/v1/public/characters?ts=2000&apikey=ff54f0e3e4b63578fbb8047c3b057516&hash=c7693a50f5572e4266b70f2e82de8933&limit=30&offset=90';

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
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Personajes",
          style: TextStyle(fontSize: 25),
        ),
        backgroundColor: Colors.purple,
        centerTitle: true,
      ),
      body: Container(
          child: Center(
        child: personaje.isEmpty
            ? CircularProgressIndicator()
            : ListView.separated(
                itemCount: personaje.length,
                separatorBuilder: (context, index) =>
                    Divider(color: Colors.red),
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
                  final List tres_primeras_series = personaje[index]['series']['items'];
                  return ListTile(
                    leading: Image.network(
                      image,
                      width: 50,
                      height: 50,
                    ),
                    trailing: Icon(Icons.arrow_right),
                    title: Text(name),
                    onTap: () {
                      Character(name, image, description, comics, series,
                          stories, events, tres_primeras_series);
                      Navigator.pushNamed(context, 'detail_character',
                          arguments: Character(name, image, description, comics,
                              series, stories, events, tres_primeras_series));
                    },
                  );
                }),
      )),
    );
  }
}
