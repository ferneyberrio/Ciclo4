import 'package:flutter/material.dart';
import 'package:paseando_mascotas/pages/home_page.dart';
import 'package:paseando_mascotas/pages/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        // imagen de fondo
        decoration: BoxDecoration(
          // image: DecorationImage(
          //     image: AssetImage("assets/chico.png")),
        ),

        child: Scaffold(
          backgroundColor: Colors.transparent,
          // barra superior
          appBar: AppBar(
            elevation: 100,
            toolbarHeight: 20,
            backgroundColor: Color.fromARGB(50, 0, 0, 255),
            title: Text("MentoresMovil"),
          ),


          body: HomePage(),
          // body: Login(),
        ),
      ),
    );

  }
}
