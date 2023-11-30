import 'package:ejercimente/screens/exercises_page.dart';
import 'package:ejercimente/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


import 'calendar.dart';

class MainPage extends StatelessWidget {
  static const TextStyle tittleStyle = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
    fontSize: 55,
  );

  static const TextStyle normalStyle = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
    fontSize: 25,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: background_blue,
          child: Center(
            child: Column(
              children: [
                MySizedBox(200.0, 75.0),
                const Text(
                    "BIENVENIDO A EJERCIMENTE",
                    style: tittleStyle,
                    textAlign: TextAlign.center
                ),
                MySizedBox(20.0, 20.0),
                const Text(
                  "¿QUÉ DESEA HACER HOY?",
                  style: normalStyle,
                  textAlign: TextAlign.center,
                ),
                MySizedBox(40.0, 40.0),
                InkWell(
                  onTap: (){
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => CalendarPage(),
                      ),
                    );
                  },
                  child: Container(
                    width: 200.0,
                    height: 125.0,
                    decoration: BoxDecoration(
                      color: widgets_background_brown,
                      border: Border.all(color: Colors.black, width: 2.0),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        MySizedBox(10.0, 10.0),
                        const Icon(
                          FontAwesomeIcons.calendar,
                          size: 70,
                          color: Colors.black,
                        ),
                        MySizedBox(10.0, 10.0),
                        const Text(
                          "CALENDARIO",
                          style: normalStyle,
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  ),
                ),
                MySizedBox(40.0, 40.0),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ExercisePage(),
                      ),
                    );
                  },
                  child: Container(
                    width: 200.0,
                    height: 125.0,
                    decoration: BoxDecoration(
                      color: widgets_background_brown,
                      border: Border.all(color: Colors.black, width: 2.0),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        MySizedBox(5.0, 5.0),
                        Image.network(
                          'https://firebasestorage.googleapis.com/v0/b/ejercimente-b02ab.appspot.com/o/iconos%2Fcerebro-mente.png?alt=media&token=12bd244d-e95b-43b1-9859-8e7ce621349c',
                          width: 80.0,
                          height: 85.0,

                        ),
                        MySizedBox(2.0, 2.0),
                        const Text(
                          "EJERCICIOS",
                          style: normalStyle,
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  ),
                ),
                MySizedBox(40.0, 40.0),
                InkWell(
                  onTap: (){

                  },
                  child: Container(
                    width: 200.0,
                    height: 125.0,
                    decoration: BoxDecoration(
                      color: widgets_background_brown,
                      border: Border.all(color: Colors.black, width: 2.0),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        const SizedBox(
                          width: 10,
                          height: 10,
                        ),
                        const Icon(
                          Icons.help, // Icono de calendario
                          size: 70, // Tamaño del icono
                          color: Colors.black, // Color del icono
                        ),
                        MySizedBox(10.0, 10.0),
                        const Text(
                          "AYUDA",
                          style: normalStyle,
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  ),
                )

              ],
            ),

          )
      ),

    );
  }

  Widget MySizedBox(double w, double h) {
    return SizedBox(
      width: w,
      height: h,
    );
  }
}