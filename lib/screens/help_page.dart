import 'package:ejercimente/screens/benefits_page.dart';
import 'package:ejercimente/screens/physical_exercise_page.dart';
import 'package:ejercimente/screens/screen_template.dart';
import 'package:ejercimente/screens/tutorial_page.dart';
import 'package:ejercimente/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'memory_exercise_page.dart';

class HelpPage extends StatelessWidget {
  static const TextStyle tittleStyle = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
    fontSize: 25,
  );

  static const TextStyle normalStyle = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
    fontSize: 20,
  );

  static const TextStyle labelStyle = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
    fontSize: 30,
  );

  @override
  Widget build(BuildContext context) {
    return ScreenTemplate(
      body: Center(
        child: Column(
          children: [
            MySizedBox(200.0, 85.0),
            Align(
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  MySizedBox(15.0, 15.0),
                  const Text(
                    "AYUDA",
                    style: tittleStyle,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            MySizedBox(80.0, 80.0),
            InkWell(
              onTap: (){
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => TutorialPage(),
                  ),
                );
              },
              child: Container(
                width: 225.0,
                height: 150.0,
                decoration: BoxDecoration(
                  color: widgets_background_brown,
                  border: Border.all(color: Colors.black, width: 2.0),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    MySizedBox(10.0, 10.0),
                    Image.network(
                      'https://firebasestorage.googleapis.com/v0/b/ejercimente-b02ab.appspot.com/o/iconos%2Ftutorial.png?alt=media&token=62cc5f8d-75fc-44db-bc71-bbb34f01e926',
                      width: 85,
                      height: 85,
                    ),
                    MySizedBox(10.0, 10.0),
                    const Text(
                      "TUTORIAL",
                      style: labelStyle,
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
            ),
            MySizedBox(50.0, 50.0),
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => BenefitsPage(),
                  ),
                );
              },
              child: Container(
                width: 225.0,
                height: 150.0,
                decoration: BoxDecoration(
                  color: widgets_background_brown,
                  border: Border.all(color: Colors.black, width: 2.0),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    MySizedBox(10.0, 10.0),
                    Image.network(
                      'https://firebasestorage.googleapis.com/v0/b/ejercimente-b02ab.appspot.com/o/iconos%2Fbeneficios.png?alt=media&token=cac74f76-0329-44ee-883d-3993385e8f50',
                      width: 85,
                      height: 85,
                    ),
                    MySizedBox(10.0, 10.0),
                    const Text(
                      "BENEFICIOS",
                      style: labelStyle,
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
            )
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