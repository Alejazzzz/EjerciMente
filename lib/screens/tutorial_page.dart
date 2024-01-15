import 'package:ejercimente/screens/main_page.dart';
import 'package:ejercimente/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class TutorialPage extends StatefulWidget {
  @override
  State<TutorialPage> createState() => _TutorialPageState();
}

class _TutorialPageState extends State<TutorialPage> {
  static DotsDecorator dots = DotsDecorator(
      size: const Size.square(6.0),
      activeSize: const Size(13.0, 6.0),
      activeColor: Colors.blue,
      color: Colors.black26,
      spacing: const EdgeInsets.symmetric(horizontal: 2.0),
      activeShape:
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(19.0)));

  static const TextStyle normalStyle = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
    fontSize: 16,
  );
  static const TextStyle finalStyle = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
    fontSize: 20,
  );

  @override
  Widget build(BuildContext context) {


    return IntroductionScreen(
      pages: listImages(),
      showSkipButton: true,
      skip: const Text("Saltar"),
      next: const Icon(Icons.arrow_forward),
      done: const Text("Hecho"),
      onDone: () => _onDone(context),
      onSkip: () => _onSkip(context),
      skipStyle: TextButton.styleFrom(foregroundColor: Colors.black),
      doneStyle: TextButton.styleFrom(foregroundColor: Colors.black),
      nextStyle: IconButton.styleFrom(foregroundColor: Colors.black),
      dotsDecorator: dots,
      globalBackgroundColor: widgets_background_brown,
    );
  }

  List<PageViewModel> listImages() {
    const pageDecoration = PageDecoration(
      contentMargin: EdgeInsets.only(top: 50, right: 5, left: 5),  // Ajusta el valor según tu preferencia
    );
    return [
      PageViewModel(
        title: 'BIENVENIDOS AL TUTORIAL',
        bodyWidget: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: [
              const Text(
                "ESTE TUTORIAL SIRVE PARA APRENDER A COMO UTILIZAR LA APLICACIÓN DESDE CERO. \n LAS DOS PRINCIPALES ACTIVIDADES SON LOS EJERCICIOS Y EL CALENDARIO. LUEGO CUENTA CON UN "
                    "APARTADO EXTRA DE AYUDA",
                style: normalStyle,
                textAlign: TextAlign.justify,
              ),
              const SizedBox(width: 20, height: 20,),
              Image.network(
                'https://firebasestorage.googleapis.com/v0/b/ejercimente-b02ab.appspot.com/o/tutorial%2Fmenu_principal.jpeg?alt=media&token=12b86450-002c-479f-864c-c86cefade93b',
                width: 375,
                height: 475,
              )
            ],
          ),
        ),
        decoration: pageDecoration,
      ),
      PageViewModel(
        title: 'BARRA INFERIOR',
        bodyWidget: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: [
              const Text(
                "EN LA PARTE INFERIOR DE LA PANTALLA CASI SIEMPRE SE ENCONTRARÁ UNA BARRA DE NAVEGACIÓN RÁPIDA PARA IR A CUALQUIERA DE LAS TRES FUNCIONALIDADES PRINCIPALES",
                style: normalStyle,
                textAlign: TextAlign.justify,
              ),
              const SizedBox(width: 20, height: 20,),
              Image.network(
                'https://firebasestorage.googleapis.com/v0/b/ejercimente-b02ab.appspot.com/o/tutorial%2FbottomAppbar.PNG?alt=media&token=6917e248-37cb-421c-8b34-5ef1c90d3dc4',
                width: 375,
                height: 475,
              )
            ],
          ),
        ),
        decoration: pageDecoration,
      ),
      PageViewModel(
        title: 'CALENDARIO',
        bodyWidget: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: [
              const Text(
                "EN EL CALENDARIO PODRÁ AÑADIR SUS EVENTOS MÁS IMPORTANTES PARA PODER RECORDARLOS EN UN FUTURO. \nUNA VEZ SELECCIONADO EL DÍA, DEBE DARLE AL BOTÓN 'AÑADIR EVENTO' Y COMPLETAR LA INFORMACIÓN RELEVANTE AL EVENTO",
                style: normalStyle,
                textAlign: TextAlign.justify,
              ),
              const SizedBox(width: 20, height: 20,),
              Image.network(
                'https://firebasestorage.googleapis.com/v0/b/ejercimente-b02ab.appspot.com/o/tutorial%2Fcalendario_arrow.png?alt=media&token=44be4680-1d2e-47a5-8ec7-17d52488bd70',
                width: 375,
                height: 475,
              )
            ],
          ),
        ),
        decoration: pageDecoration,
      ),
      PageViewModel(
        title: 'EJERCICIOS',
        bodyWidget: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: [
              const Text(
                "LA SECCIÓN DE EJERCICIOS SE DIVIDE EN DOS TIPOS: EJERCICIOS FÍSICOS O DE MEMORIA",
                style: normalStyle,
                textAlign: TextAlign.justify,
              ),
              const SizedBox(width: 20, height: 20,),
              Image.network(
                'https://firebasestorage.googleapis.com/v0/b/ejercimente-b02ab.appspot.com/o/tutorial%2Fejercicios.jpeg?alt=media&token=545790de-4dfe-4e14-8f17-d02eeddc10f1',
                width: 375,
                height: 475,
              )
            ],
          ),
        ),
        decoration: pageDecoration,
      ),
      PageViewModel(
        title: 'EJERCICIOS FÍSICOS',
        bodyWidget: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: [
              const Text(
                "LOS EJERCICIOS FÍSICOS SE DIVIDEN EN TRES TIPOS: FUERZA, EQUILIBRIO Y MARCHA",
                style: normalStyle,
                textAlign: TextAlign.justify,
              ),
              const SizedBox(width: 20, height: 20,),
              Image.network(
                'https://firebasestorage.googleapis.com/v0/b/ejercimente-b02ab.appspot.com/o/tutorial%2Fejercicio_fisico.jpeg?alt=media&token=f1be6a31-48dc-4a01-83e0-748f79770ff1',
                width: 375,
                height: 475,
              )
            ],
          ),
        ),
        decoration: pageDecoration,
      ),
      PageViewModel(
        title: 'EJERCICIOS FÍSICOS',
        bodyWidget: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: [
              const Text(
                "LOS TRES TIPOS FUNCIONAN DE LA MISMA MANERA. UNA VEZ HAYAMOS SELECCIONADO UNO DE ELLOS, SE MOSTRARÁ UN LISTADO DE ESTOS EJERCICIOS Y DEBERÁ SELECCIONAR EL QUE DESEÉ REALIZAR CON UN CLICK",
                style: normalStyle,
                textAlign: TextAlign.justify,
              ),
              const SizedBox(width: 20, height: 20,),
              Image.network(
                'https://firebasestorage.googleapis.com/v0/b/ejercimente-b02ab.appspot.com/o/tutorial%2Flista_ejercicio.jpeg?alt=media&token=a5a72f0e-ba28-40a3-a10f-eab7bc4939aa',
                width: 375,
                height: 475,
              )
            ],
          ),
        ),
        decoration: pageDecoration,
      ),
      PageViewModel(
        title: 'EJERCICIOS FÍSICOS',
        bodyWidget: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: [
              const Text(
                "UNA VEZ EN EL EJERCICIO, PODRÁ VER TODO TIPO DE INFORMACIÓN RELATIVA A EL COMO PUEDE SER SU NOMBRE, INSTRUCCIONES, MÚSCULOS INVOLUCRADOS Y MUCHO MÁS",
                style: normalStyle,
                textAlign: TextAlign.justify,
              ),
              const SizedBox(width: 20, height: 20,),
              Image.network(
                'https://firebasestorage.googleapis.com/v0/b/ejercimente-b02ab.appspot.com/o/tutorial%2Finstrucciones.jpeg?alt=media&token=d3bc7a86-d806-444e-b949-dd9c4b57b93e',
                width: 375,
                height: 475,
              )
            ],
          ),
        ),
        decoration: pageDecoration,
      ),
      PageViewModel(
        title: 'EJERCICIOS DE MEMORIA',
        bodyWidget: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: [
              const Text(
                "EXISTEN DOS EJERCICIOS DE MEMORIA, UNO LLAMADO PAREJAS Y OTRO LLAMADO FECHAS",
                style: normalStyle,
                textAlign: TextAlign.justify,
              ),
              const SizedBox(width: 20, height: 20,),
              Column(
                children: [
                  Image.network(
                    'https://firebasestorage.googleapis.com/v0/b/ejercimente-b02ab.appspot.com/o/tutorial%2Fjuego_parejas.jpeg?alt=media&token=2f0b4ca0-bc21-410e-afee-bdf2311dc2c5',
                    width: 225,
                    height: 275,
                  ),
                  const SizedBox(width: 5, height: 5,),
                  Image.network(
                    'https://firebasestorage.googleapis.com/v0/b/ejercimente-b02ab.appspot.com/o/tutorial%2Fjuego_fechas.jpeg?alt=media&token=a0158add-5466-4997-83a2-5b361b225031',
                    width: 225,
                    height: 275,
                  ),
                ],
              )
            ],
          ),
        ),
        decoration: pageDecoration,
      ),
      PageViewModel(
        title: 'EJERCICIOS DE MEMORIA',
        bodyWidget: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: [
              const Text(
                "UNA VEZ SELECCIONADO EL EJERCICIO DE MEMORIA QUE DESEÉ REALIZAR, SE MOSTRARÁN LAS INSTRUCCIONES DE DICHO EJERCICIO Y PODRÁ INICIAR EL JUEGO",
                style: normalStyle,
                textAlign: TextAlign.justify,
              ),
              const SizedBox(width: 20, height: 20,),
              Image.network(
                'https://firebasestorage.googleapis.com/v0/b/ejercimente-b02ab.appspot.com/o/tutorial%2Fparejas.jpeg?alt=media&token=e0eea2fb-5079-40ff-9752-6d0190c19680',
                width: 375,
                height: 475,
              )
            ],
          ),
        ),
        decoration: pageDecoration,
      ),
      PageViewModel(
        title: '',
        bodyWidget: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: [
              SizedBox(width: 50.0, height: 180.0,),
              Text(
                "HASTA AQUÍ LLEGA EL TUTORIAL DE EJERCIMENTE, ESPERO QUE LE HAYA AYUDADO Y PUEDA DISFRUTAR AL COMPLETO DE ESTA APLICACIÓN. \n PULSE EL BOTÓN HECHO EN LA ESQUINA INFERIOR DERECHA PARA VOLVER AL MENÚ",
                style: finalStyle,
                textAlign: TextAlign.justify,
              ),
            ],
          ),
        ),
        decoration: pageDecoration,
      ),


    ];
  }

  void _onDone(context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => MainPage()),
    );
  }

  void _onSkip(context) {
    Navigator.of(context).pop();
  }
}