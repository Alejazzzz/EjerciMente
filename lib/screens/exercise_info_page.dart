import 'package:ejercimente/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ExerciseInfoPage extends StatefulWidget {
  final String exerciseName;

  ExerciseInfoPage({required this.exerciseName});

  @override
  _ExerciseInfoPageState createState() => _ExerciseInfoPageState();
}

class _ExerciseInfoPageState extends State<ExerciseInfoPage> {
  late Future<DocumentSnapshot<Map<String, dynamic>>> exerciseInfo;

  @override
  void initState() {
    super.initState();
    exerciseInfo = _loadExerciseInfo();
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> _loadExerciseInfo() async {
    return FirebaseFirestore.instance.collection('FUERZA').doc(widget.exerciseName).get();
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
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Nombre: ${exerciseData['nombre']}',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            'Parte del Cuerpo: ${exerciseData['parte del cuerpo']}',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 8),
          Text(
            'Instrucciones: ${exerciseData['instrucciones']}',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 8),
          Text(
            'Repeticiones: ${exerciseData['repeticiones']}',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}