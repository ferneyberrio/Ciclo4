import 'package:flutter/material.dart';
import 'package:turyn_viajes/pages/perfilsitios.dart';
import '../models/user.dart';
import '../repository/firebase_api.dart';
import 'login_page.dart';

class RegisterPlace extends StatefulWidget {
  final llave ;
  const RegisterPlace(this.llave,{Key? key}) : super(key: key);

  @override
  State<RegisterPlace> createState() => _RegisterPlaceState();
}

class _RegisterPlaceState extends State<RegisterPlace> {
  FirebaseApi _firebaseApi = FirebaseApi();
  final _name = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _logo = TextEditingController();
  final _descCorta = TextEditingController();
  final _descLarga = TextEditingController();
  final _latitud = TextEditingController();
  final _longitud = TextEditingController();
  final _direccion = TextEditingController();


  void _actualUser(Usuar _user) async {
    var result = await _firebaseApi.updateUser(_user);

    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => PerfilSitios(_user.uid)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Form(
              child: Column(
                children: [
                  TextFormField(
                    controller: _name,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'nombre',
                        hintText: 'nombre'),
                    keyboardType: TextInputType.text,
                  ),
                  TextFormField(
                    controller: _email,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'email',
                        hintText: 'email'),
                    keyboardType: TextInputType.text,
                  ),
                  TextFormField(
                    controller: _password,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'clave',
                        hintText: 'clave'),
                    keyboardType: TextInputType.text,
                  ),
                  TextFormField(
                    controller: _logo,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Imagen',
                        hintText: 'Link Imagen de muestra'),
                    keyboardType: TextInputType.url,
                  ),
                  TextFormField(
                    controller: _descCorta,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Descripción corta',
                        hintText: 'Descripción corta'),
                    keyboardType: TextInputType.text,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: _descLarga,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Descripción Larga',
                        hintText: 'Descripción Larga'),
                    keyboardType: TextInputType.text,
                  ),
                  TextFormField(
                    controller: _latitud,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'latitud',
                        hintText: 'ingrese latitud'),
                    keyboardType: TextInputType.number,
                  ),
                  TextFormField(
                    controller: _longitud,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'longitud',
                        hintText: 'Ingrese longitud'),
                    keyboardType: TextInputType.number,
                  ),
                  TextFormField(
                    controller: _direccion,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'direccion',
                        hintText: 'Ingrese direccion'),
                    keyboardType: TextInputType.number,
                  ),
                  ElevatedButton(
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 16),
                    ),
                    onPressed: () {
                      //guardamos en base de datos en user
                      var user = Usuar(
                          widget.llave,
                          _name.text,
                          _email.text,
                          _password.text,
                          'widget.usuario.genre',
                          'widget.usuario.favoritesGenres',
                          'widget.usuario.bornDate',
                          _logo.text,
                          _descCorta.text,
                          _descLarga.text,
                      _latitud.text,
                        _longitud.text,
                        _direccion.text
                      );

                      _actualUser(user);
                    },
                    child: Text('Almacenar sitio'),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}