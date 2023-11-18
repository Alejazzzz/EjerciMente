import 'package:ejercimente/screens/screen_template.dart';
import 'package:ejercimente/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DatesPage extends StatelessWidget {

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

  DateTime today = DateTime.now();

  @override
  Widget build(BuildContext context) {
    DateTime twoWeeksAgo = today.subtract(Duration(days: 14));

    DateTime randomDate = twoWeeksAgo.add(
      Duration(days: (DateTime.now().difference(twoWeeksAgo).inDays * 0.5).round()),
    );

    String formattedDate = "${_getDayOfWeek(randomDate.weekday)} ${randomDate.day} de ${_getMonthName(randomDate.month)}";

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
                    "FECHAS",
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
                padding: EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  color: widgets_background_brown,
                  border: Border.all(color: Colors.black, width: 2.0),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Column(
                    children: [
                      MySizedBox(10.0, 10.0),
                      MySizedBox(10.0, 10.0),
                      InkWell(
                        onTap: (){

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

  String _getDayOfWeek(int day) {
    switch (day) {
      case DateTime.monday:
        return "Lunes";
      case DateTime.tuesday:
        return "Martes";
      case DateTime.wednesday:
        return "Miércoles";
      case DateTime.thursday:
        return "Jueves";
      case DateTime.friday:
        return "Viernes";
      case DateTime.saturday:
        return "Sábado";
      case DateTime.sunday:
        return "Domingo";
      default:
        return "";
    }
  }

  String _getMonthName(int month) {
    switch (month) {
      case DateTime.january:
        return "enero";
      case DateTime.february:
        return "febrero";
      case DateTime.march:
        return "marzo";
      case DateTime.april:
        return "abril";
      case DateTime.may:
        return "mayo";
      case DateTime.june:
        return "junio";
      case DateTime.july:
        return "julio";
      case DateTime.august:
        return "agosto";
      case DateTime.september:
        return "septiembre";
      case DateTime.october:
        return "octubre";
      case DateTime.november:
        return "noviembre";
      case DateTime.december:
        return "diciembre";
      default:
        return "";
    }
  }

  Widget MySizedBox(double w, double h) {
    return SizedBox(
      width: w,
      height: h,
    );
  }
}