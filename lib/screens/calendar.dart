import 'package:ejercimente/screens/screen_template.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';


class CalendarPage extends StatefulWidget {
  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {


  @override
  Widget build(BuildContext context) {
    return ScreenTemplate(
        body: Column(
          children: [
            MySizedBox(20.0,20.0),
            TableCalendar(
              locale: 'es_ES',
              firstDay: DateTime.utc(2010, 10, 16),
              lastDay: DateTime.utc(2030, 3, 14),
              focusedDay: DateTime.now(),
            )
          ],
        )
    );
  }

  Widget MySizedBox(double w, double h) {
    return SizedBox(
      width: w,
      height: h,
    );
  }
}

