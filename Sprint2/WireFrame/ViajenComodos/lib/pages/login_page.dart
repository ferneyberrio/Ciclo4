import 'package:flutter/material.dart';
import 'package:paseando_mascotas/pages/home_page.dart';
import 'package:paseando_mascotas/pages/registrar_page.dart';

import '../main.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final email = TextEditingController();
  final password = TextEditingController();

  void validarUsuario() {
    if (email.text.isNotEmpty && password.text.isNotEmpty) {
      if (email.text == "mentoresmovil@gmail.com") {
        if (password.text == "mentores123*") {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const MyApp()));
        } else {
          mostrarMensaje("Contraseña Incorrecta.");
        }
      } else {
        mostrarMensaje("Usuario no registrado.");
      }
    } else {
      mostrarMensaje("Datos Obligatorios.");
    }
  }

  void mostrarMensaje(String mensaje) {
    final pantalla = ScaffoldMessenger.of(context);
    pantalla.showSnackBar(SnackBar(
      content: Text(
        mensaje,
        style: const TextStyle(fontSize: 20),
      ),
      backgroundColor: const Color(0xFFD50000),
      duration: const Duration(seconds: 10),
      action: SnackBarAction(
          label: 'Registrese',
          onPressed: () {
            pantalla.hideCurrentSnackBar;
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => RegistrarPage()));
          }),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mentores Movil'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.home),
            tooltip: 'Show Snackbar',
            onPressed: () {
              // para redirigir
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => MyApp()));

              // ScaffoldMessenger.of(context).showSnackBar(
              //     SnackBar(content: Text('This is a snackbar')));
            },
          ),
        ],
      ),
      drawer: Drawer(
        // width: 200,
        backgroundColor: Color.fromARGB(42, 3, 60, 107),
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Mentores Movil'),
              decoration: BoxDecoration(
                color: Color.fromARGB(200, 79, 166, 238),
              ),
            ),
            ListTile(
              iconColor: Colors.white,
              leading: Icon(
                Icons.home,
                size: 40,
              ),
              title: Text('MENU'),
              subtitle: Text("Regresar al MENU"),
              trailing: Icon(Icons.more_vert),
              textColor: Colors.white,
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => MyApp()));
              },
            ),
            ListTile(
              title: Text('Second item'),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
          child: Center(
            child: Column(
              children: [
                Container(
                  child: const Image(
                    image: AssetImage("assets/chico.png"),
                    // width: 120,
                    // height: 120
                  ),
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  margin: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(200),
                      border: Border.all(color: Colors.black38, width: 4),
                      color: Colors.blue),
                ),
                TextFormField(
                  controller: email,
                  decoration: const InputDecoration(
                      labelText: "Correo Electronico",
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(Icons.email_outlined,
                          color: Colors.blue, size: 24)),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: password,
                  obscureText: true,
                  //keyboardType: TextInputType.emailAddress,
                  //maxLength: 8,
                  decoration: const InputDecoration(
                    labelText: "Password",
                    border: OutlineInputBorder(),
                    suffixIcon:
                        Icon(Icons.vpn_key_sharp, color: Colors.blue, size: 24),
                  ),
                ),
                TextButton(
                    style: TextButton.styleFrom(
                        textStyle: const TextStyle(
                            fontSize: 16,
                            fontStyle: FontStyle.italic,
                            color: Colors.blue)),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const RegistrarPage()));
                    },
                    child: const Text("Registrarse")),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        fixedSize: const Size(300, 50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                        shadowColor: Colors.black26,
                        textStyle: const TextStyle(
                            fontStyle: FontStyle.italic, fontSize: 20)),
                    onPressed: () {
                      validarUsuario();
                    },
                    child: const Text("Ingresar"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
