import 'package:ejercimente/screens/exercise_list.dart';
import 'package:ejercimente/screens/screen_template.dart';
import 'package:ejercimente/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PhysicalPage extends StatelessWidget {
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
                    "EJERCICIOS FÍSICOS",
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
                    builder: (context) => ListExercisePage(),
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
                      'https://firebasestorage.googleapis.com/v0/b/ejercimente-b02ab.appspot.com/o/iconos%2Fbiceps.png?alt=media&token=84823302-1e1e-4061-b71a-e191f0728260',
                      width: 80.0,
                      height: 80.0,
                      fit: BoxFit.cover,
                    ),
                    MySizedBox(10.0, 10.0),
                    const Text(
                      "FUERZA",
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
                      'https://firebasestorage.googleapis.com/v0/b/ejercimente-b02ab.appspot.com/o/iconos%2Fbalan%C3%A7a.png?alt=media&token=67270c69-bab8-4ff5-9682-89c4f117e8bb',
                      width: 80.0,
                      height: 80.0,
                      fit: BoxFit.cover,
                    ),
                    MySizedBox(10.0, 10.0),
                    const Text(
                      "EQUILIBRIO",
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
                    Image.network(
                      'https://firebasestorage.googleapis.com/v0/b/ejercimente-b02ab.appspot.com/o/iconos%2Fpersona-andando.png?alt=media&token=cb0ae815-cdd5-4625-a2bb-023cddd99406',
                      width: 50.0,
                      height: 74.0,
                      fit: BoxFit.cover,
                    ),
                    MySizedBox(10.0, 10.0),
                    const Text(
                      "MARCHA",
                      style: normalStyle,
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