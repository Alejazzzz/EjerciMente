import 'package:ejercimente/screens/couples_dates_menu_page.dart';
import 'package:ejercimente/screens/physical_exercise_page.dart';
import 'package:ejercimente/screens/screen_template.dart';
import 'package:ejercimente/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MemoryPage extends StatelessWidget {
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
                    "EJERCICIOS DE MEMORIA",
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
                    builder: (context) => CoupleDatesPage(title: 'PAREJAS', couples: true),
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
                      'https://firebasestorage.googleapis.com/v0/b/ejercimente-b02ab.appspot.com/o/parejas.png?alt=media&token=4284e8cf-d4de-4dd2-a643-3bb1648ba18c',
                      width: 155.0,
                      height: 80.0,
                      fit: BoxFit.cover,
                    ),
                    MySizedBox(10.0, 10.0),
                    const Text(
                      "PAREJAS",
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
                    builder: (context) => CoupleDatesPage(title: 'FECHAS', couples: false),
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
                    Image.network(
                      'https://firebasestorage.googleapis.com/v0/b/ejercimente-b02ab.appspot.com/o/nube-fechas.png?alt=media&token=92ba64a3-55de-4619-9f3a-0b2cc2d41aee',
                      width: 170.0,
                      height: 90.0,
                    ),
                    MySizedBox(10.0, 10.0),
                    const Text(
                      "FECHAS",
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