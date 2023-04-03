
import 'package:flutter/material.dart';
import 'api/main_api.dart';
import 'api/pages/detail_character.dart';

void main() {
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(
      ),
      home: MainAppMarvel(),
      routes: {'detail_character':(context) => DetailCharacter()},
      //  Scaffold(
      //     appBar: AppBar(
      //       title: const Text("To Do"),
      //       titleSpacing: 100,
      //     ),
      //     body:ButtonBase(),

      //  )
    );
  }
}