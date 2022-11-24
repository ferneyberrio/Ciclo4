import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:turyn_viajes/pages/googlemaps.dart';
import 'package:turyn_viajes/pages/perfilsitios.dart';
import 'package:turyn_viajes/pages/register_place.dart';

import '../models/user.dart';
import 'menu_page.dart';

class HomePage extends StatefulWidget {
  final llave ;
  const HomePage(this.llave, {Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var nombre = '';
  List sitios = [];
  List<dynamic> idDoc = [];

  @override
  Future getsitios() async {
    print('entro a sitios');
    idDoc.clear();
    sitios.clear();
    String id = "";
    QuerySnapshot _sitios = await FirebaseFirestore.instance
        .collection("users")
        .where("uid", isNotEqualTo: FirebaseAuth.instance.currentUser?.uid)
        .get();
    setState(() {
      if (_sitios.docs.isNotEmpty) {
        for (var pas in _sitios.docs) {
          id = pas.id; //Trae el id
          idDoc.add(id);
          sitios.add(pas.data());
          print("------------------------>>>>>>>>>>>>>>>>>>><<< ID " + id);
          print("------------------------>>>>>>>>>>>>>>>>>>><<< " +
              pas.data().toString());
        }
        print('********iddocs********');
        print(idDoc);
        print('********sitios********');
        print(sitios);
        print('****************');

          print(sitios[0]['name']);
          var nu = sitios.length-1;
        nombre = sitios[nu]['name'];
      }

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text((FirebaseAuth.instance.currentUser?.email).toString()),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PerfilSitios(FirebaseAuth.instance.currentUser?.uid)));
              },
              icon: const Icon(Icons.not_listed_location,
                  size: 30, color: Colors.white))
        ],
      ),
      drawer: MenuPage((FirebaseAuth.instance.currentUser?.email).toString()),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 50),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                ElevatedButton(
                    onPressed: () {
                      print('entre a la pagina presionado');
                      setState(() {
                        // getsitios();
                        // Navigator.push(context,
                        //     MaterialPageRoute(builder: (context) =>  Geolocalizacion()));

                      });
                    }, child: const Text('Entre a la pagina')),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add, size: 30, color: Colors.white),
        onPressed: () {
          print('float presionado');
          Navigator.push(context,
              MaterialPageRoute(builder: (context) =>  RegisterPlace(FirebaseAuth.instance.currentUser?.uid)));
        },
      ),
      bottomNavigationBar: const menuInferior(),
    );
  }
}

class miCardImage extends StatelessWidget {
  final String url;
  final String texto;

  miCardImage(this.url, this.texto);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      margin: EdgeInsets.all(20),
      elevation: 20,
      color: Colors.lightGreenAccent,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(40),
        child: Column(
          children: [
            Image.network(
              url,
              width: MediaQuery.of(context).size.width,
              height: 250,
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(5),
              color: Colors.lightGreenAccent,
              child: Text(texto,
                  style: const TextStyle(fontSize: 20, color: Colors.white)),
            )
          ],
        ),
      ),
    );
  }
}