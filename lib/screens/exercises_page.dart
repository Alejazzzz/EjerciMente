import 'package:ejercimente/screens/physical_exercise_page.dart';
import 'package:ejercimente/screens/screen_template.dart';
import 'package:ejercimente/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'memory_exercise_page.dart';

class ExercisePage extends StatelessWidget {
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
                    "EJERCICIOS",
                    style: tittleStyle,
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
            MySizedBox(20.0, 20.0),
            const Text(
              "SELECCIONE UN TIPO DE EJERCICIO",
              style: normalStyle,
              textAlign: TextAlign.center,
            ),
            MySizedBox(50.0, 50.0),
            InkWell(
              onTap: (){
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => PhysicalPage(),
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
                    const Icon(
                      FontAwesomeIcons.child,
                      size: 80,
                      color: Colors.black,
                    ),
                    MySizedBox(10.0, 10.0),
                    const Text(
                      "FÍSICO",
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
                    builder: (context) => MemoryPage(),
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
                    const Icon(
                      FontAwesomeIcons.brain,
                      size: 80,
                      color: Colors.black,
                    ),
                    MySizedBox(10.0, 10.0),
                    const Text(
                      "MEMORIA",
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