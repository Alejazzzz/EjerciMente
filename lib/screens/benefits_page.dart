import 'package:ejercimente/screens/dates_page.dart';
import 'package:ejercimente/screens/screen_template.dart';
import 'package:ejercimente/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'couples_page.dart';

class BenefitsPage extends StatelessWidget {

  static const TextStyle tittleStyle = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
    fontSize: 25,
  );

  static const TextStyle normalStyle = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
    fontSize: 16,
    height: 1.5,
  );

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
                  const Text(
                    'BENEFICIOS',
                    style: tittleStyle,
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
            MySizedBox(10.0, 10.0),
            Container(
                width: 320.0,
                height: 530.0,
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: widgets_background_brown,
                  border: Border.all(color: Colors.black, width: 2.0),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: Column(
                    children: [
                      Text(
                        'MANTENER EL CUERPO Y LA MENTE SANAS PROPORCIONA INNUMERABLES BENEFICIOS RELACIONADOS CON LA MEJORA DE LA CALIDAD DE VIDA. LA ACTIVIDAD FÍSICA REGULAR NO SOLO FORTALECE LOS MÚSCULOS Y MEJORA LA MOVILIDAD, SINO QUE TAMBIÉN CONTRIBUYE A UN CORAZÓN MÁS SALUDABLE Y A UN SISTEMA MÁS ROBUSTO. AL MISMO TIEMPO, LOS EJERCICIOS DE MEMORIA Y LOS COGNITIVOS AYUDAN A MANTENER LA MENTE ÁGIL, ESTIMULANDO ASPECTOS TALES COMO LA CONCENTRACIÓN Y AYUDANDO A PREVENIR EL DETERIORO COGNITIVO. UN CUERPO EN FORMA Y UNA MENTE ACTIVA SE TRADUCEN EN MAYOR ENERGÍA  Y UNA SENSACIÓN GENERAL DE BIENESTAR.\n¡INVIERTE EN TU SALUD PARA MEJORAR TU CALIDAD DE VIDA!',
                        style: normalStyle,
                        textAlign: TextAlign.justify,
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