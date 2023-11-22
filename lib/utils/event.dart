import 'package:cloud_firestore/cloud_firestore.dart';

class Event{
  final String title;
  Event(this.title);
}

class FirebaseService {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> saveEvents(DateTime date, List<Event> events) async {
    final dateString = date.toIso8601String();
    final eventsMap = events.map((event) => {'title': event.title}).toList();

    await _firestore.collection('EVENTOS').doc(dateString).set(
      {
        'events': eventsMap,
      },
      SetOptions(merge: true),
    );
  }

  Future<Map<DateTime, List<Event>>> loadEvents() async {
    final QuerySnapshot<Map<String, dynamic>> querySnapshot =
    await _firestore.collection('EVENTOS').get();

    final Map<DateTime, List<Event>> events = {};

    for (final QueryDocumentSnapshot<Map<String, dynamic>> document in querySnapshot.docs) {
      final dateString = document.id;
      final date = DateTime.parse(dateString);
      final List<dynamic> eventsData = document.data()['events'];

      final List<Event> eventsList = eventsData
          .map((eventData) => Event(eventData['title'] as String))
          .toList();

      events[date] = eventsList;
    }

    return events;
  }
}