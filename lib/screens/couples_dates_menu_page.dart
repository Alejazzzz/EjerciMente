import 'package:ejercimente/screens/dates_page.dart';
import 'package:ejercimente/screens/screen_template.dart';
import 'package:ejercimente/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'couples_page.dart';

class CoupleDatesPage extends StatelessWidget {
  final String title;
  final bool couples;

  CoupleDatesPage({required this.title, required this.couples});

  static const TextStyle tittleStyle = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
    fontSize: 25,
  );

  static const TextStyle normalStyle = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
    fontSize: 22,
  );

  static const TextStyle gameStyle = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontSize: 35,
  );

  Widget buildCoupleOrDate(bool couples) {
    if (couples == true) {
      return const Text(
        'ESTE JUEGO CONSISTE EN MEMORIZAR EN VEINTE SEGUNDOS LAS PAREJAS DE IMÁGENES. UNA VEZ PASE ESTE TIEMPO, TODAS LAS IMÁGENES QUEDARÁN OCULTAS Y TU TAREA SERÁ RELACIONAR LAS PAREJAS CLICKANDO EN CADA UNA DE ELLAS. CADA ACIERTO SERÁN 100 PUNTOS. PARA JUGAR PULSE EL BOTÓN LILA "JUGAR" QUE SE ENCUENTRA DEBAJO',
        style: normalStyle,
        textAlign: TextAlign.justify,

      );
    } else {
      return const Text(
        'ESTE JUEGO CONSISTE EN RECORDAR QUE ESTABA HACIENDO EN LA FECHA QUE LE APARECERÁ POR PANTALLA. UNA VEZ RECUERDES QUÉ HICISTE ESE DÍA, PUEDES OPTAR POR GENERAR UNA FECHA DISTINTA Y REPETIR EL EJERCICIO O VOLVER AL MENÚ PRINCIPAL. PARA JUGAR PULSE EL BOTÓN LILA "JUGAR" QUE SE ENCUENTRA DEBAJO',
        style: normalStyle,
        textAlign: TextAlign.justify,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScreenTemplate(
      body: Center(
        child: Column(
          children: [
            MySizedBox(200.0, 75.0),
            Align(
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      size: 30,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },

                  ),
                  Text(
                    title,
                    style: tittleStyle,
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
            MySizedBox(10.0, 10.0),
            Container(
              width: 305.0,
              height: 510.0,
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: widgets_background_brown,
                border: Border.all(color: Colors.black, width: 2.0),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Column(
                  children: [
                    MySizedBox(10.0, 10.0),
                    buildCoupleOrDate(couples),
                    MySizedBox(10.0, 10.0),
                    InkWell(
                      onTap: (){
                        if (couples) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => CouplesPage()),
                          );
                        } else {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => DatesPage()),
                          );
                        }
                      },
                      child: Container(
                        width: 170.0,
                        height: 90.0,
                        padding: EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                          color: purple_games,
                          border: Border.all(color: Colors.black, width: 2.0),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Row(
                          children: [
                            Icon(
                              FontAwesomeIcons.play,
                              size: 40,
                              color: Colors.white,
                            ),

                            Text(
                              "JUGAR",
                              style: gameStyle,
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                      ),
                    ),

                  ],
                ),
              )
            ),
          ],
        ),
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