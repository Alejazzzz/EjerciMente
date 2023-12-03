import 'dart:math';

import 'package:ejercimente/screens/screen_template.dart';
import 'package:ejercimente/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'main_page.dart';

class DatesPage extends StatefulWidget {
  @override
  _DatesPageState createState() => _DatesPageState();
}

class _DatesPageState extends State<DatesPage> {

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
    color: Colors.black,
    fontWeight: FontWeight.bold,
    fontSize: 35,
  );

  static const TextStyle buttonStyle = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontSize: 20,
  );

  DateTime today = DateTime.now();
  late String generatedRandomDate;

  @override
  void initState() {
    super.initState();
    generatedRandomDate = _generateRandomDate(today);
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
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: widgets_background_brown,
                  border: Border.all(color: Colors.black, width: 2.0),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Column(
                    children: [
                      Text(
                        "HOY ESTAMOS A ${_getDayOfWeek(today.weekday)}, ${today.day} DE ${_getMonthName(today.month)}",
                        style: normalStyle,
                        textAlign: TextAlign.center,
                      ),
                      MySizedBox(40.0, 40.0),
                      const Text(
                        "LA FECHA A RECORDAR ES:",
                        style: gameStyle,
                        textAlign: TextAlign.center,
                      ),
                      MySizedBox(40.0, 40.0),
                      Text(
                        generatedRandomDate,
                        style: gameStyle,
                        textAlign: TextAlign.center,
                      ),
                      MySizedBox(40.0, 40.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: (){
                              setState(() {
                                generatedRandomDate = _generateRandomDate(today);
                              });
                            },
                            child: Container(
                              width: 130.0,
                              height: 70.0,
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
                                    "OTRA\nFECHA",
                                    style: buttonStyle,
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              ),
                            ),
                          ),
                          MySizedBox(5.0, 5.0),
                          InkWell(
                            onTap: (){
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => MainPage(),
                                ),
                              );
                            },
                            child: Container(
                              width: 130.0,
                              height: 70.0,
                              padding: EdgeInsets.all(5.0),
                              decoration: BoxDecoration(
                                color: purple_games,
                                border: Border.all(color: Colors.black, width: 2.0),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                children: [
                                  const Icon(
                                    FontAwesomeIcons.home,
                                    size: 35,
                                    color: Colors.white,
                                  ),
                                  MySizedBox(10.0, 10.0),
                                  const Text(
                                    "MENÚ",
                                    style: buttonStyle,
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
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

  String _generateRandomDate(DateTime today){
    DateTime twoWeeksAgo = today.subtract(Duration(days: 14));
    int totalDaysDifference = DateTime.now().difference(twoWeeksAgo).inDays;
    int randomDaysOffset = Random().nextInt(totalDaysDifference + 1);
    DateTime randomDate = twoWeeksAgo.add(Duration(days: randomDaysOffset));
    String generatedRandomDate = "${_getDayOfWeek(randomDate.weekday)}, ${randomDate.day} DE ${_getMonthName(randomDate.month)}";
    return generatedRandomDate;
  }

  String _getDayOfWeek(int day) {
    switch (day) {
      case DateTime.monday:
        return "LUNES";
      case DateTime.tuesday:
        return "MARTES";
      case DateTime.wednesday:
        return "MIÉRCOLES";
      case DateTime.thursday:
        return "JUEVES";
      case DateTime.friday:
        return "VIERNES";
      case DateTime.saturday:
        return "SÁBADO";
      case DateTime.sunday:
        return "DOMINGO";
      default:
        return "";
    }
  }

  String _getMonthName(int month) {
    switch (month) {
      case DateTime.january:
        return "ENERO";
      case DateTime.february:
        return "FEBRERO";
      case DateTime.march:
        return "MARZO";
      case DateTime.april:
        return "ABRIL";
      case DateTime.may:
        return "MAYO";
      case DateTime.june:
        return "JUNIO";
      case DateTime.july:
        return "JULIO";
      case DateTime.august:
        return "AGOSTO";
      case DateTime.september:
        return "SEPTIEMBRE";
      case DateTime.october:
        return "OCTUBRE";
      case DateTime.november:
        return "NOVIEMBRE";
      case DateTime.december:
        return "DICIEMBRE";
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