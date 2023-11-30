//importaciones Firebase
import 'package:firebase_storage/firebase_storage.dart';

Future<String> getImageDownloadURL(String imagePath) async {
  Reference reference = FirebaseStorage.instance.ref().child(imagePath);
  return await reference.getDownloadURL();
}

Future<void> setupApp() async {
  String imageUrl2 = await getImageDownloadURL('ejercicios/00846750b8731eb2ef35d856b62d167b.jpg');
  String imageUrl3 = await getImageDownloadURL('ejercicios/650_1200.jpg');
  String imageUrl4 = await getImageDownloadURL('ejercicios/elevacion-peliva.jpg');
  String imageUrl5 = await getImageDownloadURL('ejercicios/high-knees-front-knee-lifts-run-and-jog-on-the-spot-exercise-flat-illustration-isolated-on-white-background-vector.jpg');
  String imageUrl6 = await getImageDownloadURL('ejercicios/images.jpg');
  String imageUrl7 = await getImageDownloadURL('ejercicios/pajaros-con-botellas-de-agua-init-pos-1440.png');
  String imageUrl8 = await getImageDownloadURL('ejercicios/rutinas-para-gym-escalador.jpg');
  print(imageUrl2);
  print(imageUrl3);
  print(imageUrl4);
  print(imageUrl5);
  print(imageUrl6);
  print(imageUrl7);
  print(imageUrl8);

}