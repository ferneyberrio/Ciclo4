import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 50),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'Tures y viajes',
                  style: TextStyle(fontSize: 30),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Image(
                  image: AssetImage('assets/images/cascada_de_payande.jpg'),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Las cascadas de Payandé son un paraíso natural de 7 cascadas ubicadas a 30 minutos de Ibagué en el corregimiento de Payandé al oriente del departamento del Tolima. Los pozos naturales de aguas cristalinas que se forman en este sitio lo han convertido en un atractivo natural a los alrededores de la capital del Tolima.',
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Image(
                  image: AssetImage('assets/images/termales-la-cabana.jpg'),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'En estos termales encontrarás aguas cristalinas de tonos azulados y toques de verde, también conocerás la Quebrada de los 7 colores y caminarás hasta la Laguna Corazón ubicada a los 4.100 m.s.n.m, la cual era visitada por algunas culturas indígenas de la zona.',
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                ElevatedButton(
                    onPressed: () {}, child: const Text('Entre a la pagina')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
