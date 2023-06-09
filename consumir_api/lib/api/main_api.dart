import 'package:consumir_api/api/pages/home.dart';
import 'package:consumir_api/api/pages/list_personajes.dart';
import 'package:flutter/material.dart';

class MainAppMarvel extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MainAppMarvel();
  }
}

class _MainAppMarvel extends State<MainAppMarvel> {
  final List<Widget> pages = [Home(), ListaPersonajes()];
  int currentlyIndex = 0;

  void changePage(int index) {
    setState(() {
      currentlyIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentlyIndex],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(),
        child: BottomNavigationBar(
          backgroundColor: Colors.black,
          onTap: changePage,
          currentIndex: currentlyIndex,
          items: const [
            BottomNavigationBarItem(
              label: "Inicio",
              icon: Icon(Icons.home, color: Colors.purple,),
            ),
            BottomNavigationBarItem(
              label: "Personajes",backgroundColor:Colors.purple,
              icon: Icon(Icons.people, color: Colors.purple,),
            )
          ],
        ),
      ),
    );
  }
}