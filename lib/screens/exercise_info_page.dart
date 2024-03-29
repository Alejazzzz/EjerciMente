import 'package:ejercimente/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../utils/timer.dart';

class ExerciseInfoPage extends StatefulWidget {
  final String exerciseName;
  final String collection;
  ExerciseInfoPage({required this.exerciseName, required this.collection});

  @override
  _ExerciseInfoPageState createState() => _ExerciseInfoPageState();
}

class _ExerciseInfoPageState extends State<ExerciseInfoPage> {
  static const TextStyle tittleStyle = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
    fontSize: 25,
  );

  static const TextStyle infoStyle = TextStyle(
    color: Colors.black,
    fontSize: 20,
  );

  late Future<DocumentSnapshot<Map<String, dynamic>>> exerciseInfo;

  @override
  void initState() {
    super.initState();
    exerciseInfo = _loadExerciseInfo();
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> _loadExerciseInfo() async {
    return FirebaseFirestore.instance.collection(widget.collection).doc(widget.exerciseName).get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background_blue,
      appBar: AppBar(
        title: Text('Detalles del ejercicio'),
      ),
      body: FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
        future: exerciseInfo,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            Map<String, dynamic> data =
                snapshot.data?.data() as Map<String, dynamic>? ?? {};
            return _buildExerciseDetails(data);
          }
        },
      ),
    );
  }

  Widget _buildExerciseDetails(Map<String, dynamic> exerciseData) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 400,
            height: 225,
            color: Colors.white,
            child: Image.network(
              '${exerciseData['gif']}',
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 10.0,15.0,0,),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Nombre',
                  style: tittleStyle,
                ),
                MyDivider(),
                MySizedBox(5, 5),
                Text(
                  '${exerciseData['nombre']}',
                  style: infoStyle,
                ),
                MySizedBox(10, 10),
                const Text(
                  'Parte del cuerpo',
                  style: tittleStyle,
                ),
                MyDivider(),
                MySizedBox(5, 5),
                Text(
                  '${exerciseData['parte del cuerpo']}',
                  style: infoStyle,
                ),
                MySizedBox(10, 10),
                const Text(
                  'Instrucciones',
                  style: tittleStyle,
                ),
                MyDivider(),
                MySizedBox(5, 5),
                Text(
                    '${exerciseData['instrucciones']}'
                        .split('-')
                        .asMap()
                        .entries
                        .map((entry) => '${entry.key + 1}. ${entry.value.trim()}')
                        .join('\n \n'),
                    style: infoStyle,
                    textAlign: TextAlign.justify
                ),
                MySizedBox(10, 10),
                const Text(
                  'Repeticiones',
                  style: tittleStyle,
                ),
                MyDivider(),
                MySizedBox(5, 5),
                Text(
                  '${exerciseData['repeticiones']}',
                  style: infoStyle,
                ),
                MySizedBox(10, 10),
                Align(
                  alignment: Alignment.center,
                  child: exerciseData.containsKey('segundos')
                      ? MyTimerButton(seconds: exerciseData['segundos'])
                      : Container(),
                )

              ],
            ),
          )
        ],
      ),
    );
  }

  Widget MySizedBox(double w, double h) {
    return SizedBox(
      width: w,
      height: h,
    );
  }

  Widget MyDivider(){
    return const Divider(
      height: 10,
      thickness: 3,
      endIndent: 150,
      color: Colors.black,
    );
  }

}