import 'package:ejercimente/screens/screen_template.dart';
import 'package:ejercimente/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:ejercimente/utils/event.dart';

class CalendarPage extends StatefulWidget {
  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  Map<DateTime, List<Event>> events = {};
  TextEditingController _eventController = TextEditingController();
  late final ValueNotifier<List<Event>> _selectedEvents;

  @override
  void initState() {
    super.initState();
    _selectedDay = _focusedDay;
    _selectedEvents = ValueNotifier(_getEventsForDay(_selectedDay!));
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if(!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
        _selectedEvents.value = _getEventsForDay(selectedDay);
      });
    }
  }

  List<Event> _getEventsForDay(DateTime day) {
    return events[day] ?? [];
  }


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
              selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
              calendarFormat: _calendarFormat,
              startingDayOfWeek: StartingDayOfWeek.monday,
              onDaySelected: _onDaySelected,
              eventLoader: _getEventsForDay,
              calendarStyle: const CalendarStyle(
                outsideDaysVisible: false,
              ),
              onFormatChanged: (format) {
                if (_calendarFormat != format) {
                  setState(() {
                    _calendarFormat = format;
                  });
                }
              },
              onPageChanged: (focusedDay) {
                _focusedDay = focusedDay;
              },
            ),
            ValueListenableBuilder<List<Event>>(
              valueListenable: _selectedEvents,
              builder: (context, value, _){
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: value.length,
                  itemBuilder: (context, index) {
                    Event currentEvent = value[index];
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ListTile(
                        onTap: () => print(""),
                        title: Text(currentEvent.title),
                      ),
                    );
                  }
                );
              }
            ),
            InkWell(
              onTap: (){
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      scrollable: true,
                      title: Text("Nombre del evento"),
                      content: Padding(
                        padding: EdgeInsets.all(8),
                        child: TextField(
                          controller: _eventController,
                        ),
                      ),
                      actions: [
                        ElevatedButton(
                            onPressed: () {
                              final selectedDay = _selectedDay!;
                              final newEvent = Event(_eventController.text);
                              events.update(
                                selectedDay,
                                    (existingEvents) {
                                  existingEvents.add(newEvent);
                                  return existingEvents;
                                },
                                ifAbsent: () => [newEvent],
                              );
                              Navigator.of(context).pop();
                              setState(() {
                                _selectedEvents.value = _getEventsForDay(selectedDay);
                              });
                            },
                            child: Text("Agregar"))
                      ],
                    );
                  },
                );
              },
              child: Container(
                height: 100,
                width: 100,
                color: widgets_background_brown,
              ),
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

