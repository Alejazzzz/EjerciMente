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
  static const TextStyle normalStyle = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
    fontSize: 20,
  );

  static const TextStyle tittleStyle = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
    fontSize: 25,
  );

  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  Map<DateTime, List<Event>> events = {};
  TextEditingController _eventController = TextEditingController();
  TextEditingController _timeEventController = TextEditingController();
  late final ValueNotifier<List<Event>> _selectedEvents;
  late FirebaseService _firebaseService;

  @override
  void initState() {
    super.initState();
    _selectedDay = _focusedDay;
    _selectedEvents = ValueNotifier(_getEventsForDay(_selectedDay!));

    _firebaseService = FirebaseService();

    _firebaseService.loadEvents().then((loadedEvents) {
      setState(() {
        events = loadedEvents;
        _selectedEvents.value = _getEventsForDay(_selectedDay!);
      });
    });
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
            MySizedBox(200.0, 65.0),
            Align(
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  MySizedBox(15.0, 15.0),
                  const Text(
                    "CALENDARIO",
                    style: tittleStyle,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
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
                outsideDaysVisible: true,
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
                        color: Colors.white
                      ),
                      child: ListTile(
                        title: Row(
                          children: [
                            Expanded(
                              child: Text(
                                currentEvent.title,
                                style: normalStyle,
                              ),
                            ),
                            Text(
                              currentEvent.time,
                              style: normalStyle,
                            ),
                          ],
                        ),
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
                      title: Text("Evento"),
                      content: Padding(
                        padding: EdgeInsets.all(8),
                        child: Column(
                          children: [
                            TextField(
                              controller: _eventController,
                              decoration: InputDecoration(labelText: 'Nombre'),
                            ),
                            TextField(
                              controller: _timeEventController,
                              decoration: InputDecoration(labelText: 'Hora'),
                              keyboardType: TextInputType.datetime,
                            ),
                          ],
                        ),
                      ),
                      actions: [
                        ElevatedButton(
                            onPressed: () {
                              final selectedDay = _selectedDay!;
                              final newEvent = Event(_eventController.text,_timeEventController.text);
                              events.update(
                                selectedDay,
                                    (existingEvents) {
                                  existingEvents.add(newEvent);
                                  return existingEvents;
                                },
                                ifAbsent: () => [newEvent],
                              );
                              _firebaseService = FirebaseService();
                              _firebaseService.saveEvents(selectedDay, events[selectedDay]!);
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
                width: 150.0,
                height: 60.0,
                decoration: BoxDecoration(
                  color: widgets_background_brown,
                  border: Border.all(color: Colors.black, width: 2.0),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: Text(
                    "Añadir evento",
                    style: normalStyle,
                  ),
                )
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

