import 'package:flutter/material.dart';
import 'package:paseando_mascotas/pages/login_page.dart';
import 'package:paseando_mascotas/pages/splash_page.dart';
import 'package:paseando_mascotas/pages/tituloppl.dart';

String txtB1 = "Login";
String txtB2 = "Menu2";
String txtB3 = "Menu3";
String titPpl = "MentoresMovil";

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    titPpl = "paseandóte";
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          // margin: EdgeInsets.only(top: 50),
          child: Titulo(),
        ),
        Container(
          child: BotonUno(),
        ),
        Container(
          child: BotonDos(),
        ),
        Container(
          child: BotonTres(),
        )
      ],
    );
  } // fin build

  // crear un boton
  ElevatedButton BotonUno() {
    return ElevatedButton(
      //onPressed: onPressed, child: child
      style:
          TextButton.styleFrom(backgroundColor: Colors.yellow.withOpacity(0.4)),
      child: Text(
        txtB1,
        style: TextStyle(
          fontSize: 40,
          // fontFamily: "titulo",
          color: Colors.white,
        ),
      ),

      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginPage()));
        print("Botón Login Presionado ");
      },
    );
  }

  // fin widget BotonUno
  ElevatedButton BotonDos() {
    return ElevatedButton(
      //onPressed: onPressed, child: child
      style:
          TextButton.styleFrom(backgroundColor: Colors.blue.withOpacity(0.4)),
      child: Text(
        txtB2,
        style: TextStyle(
          fontSize: 40,
          // fontFamily: "titulo",
          color: Colors.white,
        ),
      ),

      onPressed: () {
        // para redirigir
        print("Boton Ingresar Presionado ");
      },
    );
  } // fin widget BotonDos

  ElevatedButton BotonTres() {
    return ElevatedButton(
      //onPressed: onPressed, child: child
      style: TextButton.styleFrom(backgroundColor: Colors.red.withOpacity(0.4)),
      child: Text(
        txtB3,
        style: TextStyle(
          fontSize: 40,
          // fontFamily: "titulo",
          color: Colors.white,
        ),
      ),

      onPressed: () {
        print("Boton registrarse Presionado ");
      },
    );
  } // fin boton3

} // fin clase
