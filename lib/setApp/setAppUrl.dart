//importaciones Firebase
import 'package:firebase_storage/firebase_storage.dart';

Future<String> getImageDownloadURL(String imagePath) async {
  Reference reference = FirebaseStorage.instance.ref().child(imagePath);
  return await reference.getDownloadURL();
}

Future<void> setupApp() async {
  String imageUrl1 = await getImageDownloadURL('tutorial/calendario.jpeg');
  print(imageUrl1);
  String imageUrl2 = await getImageDownloadURL('tutorial/ejercicio_fisico.jpeg');
  print(imageUrl2);
  String imageUrl3 = await getImageDownloadURL('tutorial/ejercicio_memoria.jpeg');
  print(imageUrl3);
  String imageUrl4 = await getImageDownloadURL('tutorial/ejercicios.jpeg');
  print(imageUrl4);
  String imageUrl5 = await getImageDownloadURL('tutorial/fechas.jpeg');
  print(imageUrl5);
  String imageUrl6 = await getImageDownloadURL('tutorial/instrucciones.jpeg');
  print(imageUrl6);
  String imageUrl7 = await getImageDownloadURL('tutorial/juego_fechas.jpeg');
  print(imageUrl7);
  String imageUrl8 = await getImageDownloadURL('tutorial/juego_parejas.jpeg');
  print(imageUrl8);
  String imageUrl9 = await getImageDownloadURL('tutorial/lista_ejercicio.jpeg');
  print(imageUrl9);
  String imageUrl10 = await getImageDownloadURL('tutorial/menu_principal.jpeg');
  print(imageUrl10);
  String imageUrl11 = await getImageDownloadURL('tutorial/parejas.jpeg');
  print(imageUrl11);
  String imageUrl12 = await getImageDownloadURL('iconos/tutorial.png');
  print(imageUrl12);
  String imageUrl13 = await getImageDownloadURL('iconos/beneficios.png');
  print(imageUrl13);



}