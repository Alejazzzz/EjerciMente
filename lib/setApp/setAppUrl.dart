//importaciones Firebase
import 'package:firebase_storage/firebase_storage.dart';

Future<String> getImageDownloadURL(String imagePath) async {
  Reference reference = FirebaseStorage.instance.ref().child(imagePath);
  return await reference.getDownloadURL();
}

Future<void> setupApp() async {
  String imageUrl1 = await getImageDownloadURL('ejercicios/fuerza/extension-triceps-botellas-agua.png');
  print(imageUrl1);
}