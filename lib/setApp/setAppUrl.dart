//importaciones Firebase
import 'package:firebase_storage/firebase_storage.dart';

Future<String> getImageDownloadURL(String imagePath) async {
  Reference reference = FirebaseStorage.instance.ref().child(imagePath);
  return await reference.getDownloadURL();
}

Future<void> setupApp() async {
  String imageUrl1 = await getImageDownloadURL('ejercicios/fuerza/abduccion-pierna-apoyado-en-silla.png');
  String imageUrl2 = await getImageDownloadURL('ejercicios/fuerza/aduccion-cadera-sentado-almohada.png');
  String imageUrl3 = await getImageDownloadURL('ejercicios/fuerza/curl-de-biceps-con-botellas.png');
  String imageUrl4 = await getImageDownloadURL('ejercicios/fuerza/elevacion-frontal-con-botellas.png');
  String imageUrl5 = await getImageDownloadURL('ejercicios/fuerza/elevacion-talones-de-pie-apoyado-en-silla.png');
  String imageUrl6 = await getImageDownloadURL('ejercicios/fuerza/extension-cadera-de-pie-apoyado-silla.png');
  String imageUrl7 = await getImageDownloadURL('ejercicios/fuerza/extension-rodilla-sentado.png');
  String imageUrl8 = await getImageDownloadURL('ejercicios/fuerza/extension-triceps-botellas-agua.png');
  String imageUrl9 = await getImageDownloadURL('ejercicios/fuerza/levantarse-silla-con-apoyo-mesa.png');
  String imageUrl10 = await getImageDownloadURL('ejercicios/fuerza/pajaros-con-botellas-de-agua.png');
  String imageUrl11 = await getImageDownloadURL('ejercicios/marcha/andar.png');
  String imageUrl12 = await getImageDownloadURL('ejercicios/marcha/carrera-en-el-sitio-o-skipinng.png');
  String imageUrl13 = await getImageDownloadURL('ejercicios/marcha/flexion-de-caderas-alternas-hacia-el-codo-contrario.png');
  String imageUrl14 = await getImageDownloadURL('ejercicios/marcha/subir-al-escalon.png');
  String imageUrl15 = await getImageDownloadURL('ejercicios/marcha/subir-escaleras.png');
  String imageUrl16 = await getImageDownloadURL('ejercicios/equilibrio/caminar-sobre-linea-recta-romberg.png');
  String imageUrl17 = await getImageDownloadURL('ejercicios/equilibrio/elevacion-talones-de-pie-apoyado-en-silla.png');
  String imageUrl18 = await getImageDownloadURL('ejercicios/equilibrio/equilibrio-sobre-una-pierna.png');
  String imageUrl19 = await getImageDownloadURL('ejercicios/equilibrio/yoga-posicion-guerrero-2.png');
  String imageUrl20 = await getImageDownloadURL('ejercicios/equilibrio/yoga-postura-del-arbol-o-vrksasana.png');
  String imageUrl21 = await getImageDownloadURL('ejercicios/equilibrio/zancada-y-elevacion-frontal-de-brazos.png');

  print(imageUrl1);
  print(imageUrl2);
  print(imageUrl3);
  print(imageUrl4);
  print(imageUrl5);
  print(imageUrl6);
  print(imageUrl7);
  print(imageUrl8);
  print(imageUrl9);
  print(imageUrl10);
  print(imageUrl11);
  print(imageUrl12);
  print(imageUrl13);
  print(imageUrl14);
  print(imageUrl15);
  print(imageUrl16);
  print(imageUrl17);
  print(imageUrl18);
  print(imageUrl19);
  print(imageUrl20);
  print(imageUrl21);
}