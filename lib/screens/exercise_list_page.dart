import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ejercimente/screens/screen_template.dart';
import 'package:ejercimente/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:ejercimente/utils/event.dart';

import 'exercise_info_page.dart';

class ListExercisePage extends StatefulWidget {
  final String collection;
  ListExercisePage({required this.collection});

  @override
  _ListExercisePageState createState() => _ListExercisePageState();
}

class _ListExercisePageState extends State<ListExercisePage> {
  static const TextStyle normalStyle = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
    fontSize: 18,
  );

  static const TextStyle tittleStyle = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
    fontSize: 25,
  );

  late Future<List<Map<String, dynamic>>> exercise;

  @override
  void initState() {
    super.initState();
    exercise = _loadExercise();
  }

  Future<List<Map<String, dynamic>>> _loadExercise() async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
    await FirebaseFirestore.instance.collection(widget.collection).get();

    return querySnapshot.docs.map((DocumentSnapshot<Map<String, dynamic>> doc) {
      return {
        'id': doc.id,
        'nombre': doc['nombre'],
        'foto': doc['foto'],
      };
    }).toList();
  }

  @override
  @override
  Widget build(BuildContext context) {
    return ScreenTemplate(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MySizedBox(150.0, 70.0),
          Row(
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
                "EJERCICIOS DE FUERZA",
                style: tittleStyle,
                textAlign: TextAlign.center,
              ),
            ],
          ),
          Expanded(
            child: FutureBuilder<List<Map<String, dynamic>>>(
              future: exercise,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  List<Map<String, dynamic>> data = snapshot.data ?? [];
                  return _buildGridView(data);
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGridView(List<Map<String, dynamic>> data) {
    return GridView.builder(
      physics: ScrollPhysics(),
      shrinkWrap: true,
      padding: EdgeInsets.all(10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 5.0,
        mainAxisSpacing: 5.0,
      ),
      itemCount: data.length,
      itemBuilder: (context, index) {
        return _buildItem(data[index]);
      },
    );
  }

  Widget _buildItem(Map<String, dynamic> item) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ExerciseInfoPage(exerciseName: item['id'], collection: widget.collection,),
          ),
        );
      },
      child: Card(
        elevation: 5,
        child: Column(
          children: [
            Image.network(
              item['foto'],
              width: 150,
              height: 140,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 8),
            Text(
              item['nombre'],
              style: normalStyle,
            ),
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

