//importaciones Firebase
import 'package:firebase_storage/firebase_storage.dart';

Future<String> getImageDownloadURL(String imagePath) async {
  Reference reference = FirebaseStorage.instance.ref().child(imagePath);
  return await reference.getDownloadURL();
}

Future<void> setupApp() async {
  String imageUrl2 = await getImageDownloadURL('cerebro-mente.png');
  String imageUrl3 = await getImageDownloadURL('balança.png');
  String imageUrl4 = await getImageDownloadURL('persona-andando.png');
  print(imageUrl2);
  print(imageUrl3);
  print(imageUrl4);
}