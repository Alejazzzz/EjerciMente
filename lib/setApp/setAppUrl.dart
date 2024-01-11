//importaciones Firebase
import 'package:firebase_storage/firebase_storage.dart';

Future<String> getImageDownloadURL(String imagePath) async {
  Reference reference = FirebaseStorage.instance.ref().child(imagePath);
  return await reference.getDownloadURL();
}

Future<void> setupApp() async {
  String imageUrl3 = await getImageDownloadURL('tutorial/ejercicio_memoria.jpeg');
  print(imageUrl3);
  String imageUrl5 = await getImageDownloadURL('tutorial/fechas.jpeg');
  print(imageUrl5);
  String imageUrl7 = await getImageDownloadURL('tutorial/juego_fechas.jpeg');
  print(imageUrl7);
  String imageUrl8 = await getImageDownloadURL('tutorial/juego_parejas.jpeg');
  print(imageUrl8);
  String imageUrl11 = await getImageDownloadURL('tutorial/parejas.jpeg');
  print(imageUrl11);
}