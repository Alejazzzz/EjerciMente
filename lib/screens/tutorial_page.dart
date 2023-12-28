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
      size: const Size.square(10.0),
      activeSize: const Size(20.0, 10.0),
      activeColor: Colors.blue,
      color: Colors.black26,
      spacing: const EdgeInsets.symmetric(horizontal: 3.0),
      activeShape:
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)));

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
    return [
      PageViewModel(
        title: 'HOLA',
        bodyWidget: Column(
          children: [
            Image.network(
              'https://firebasestorage.googleapis.com/v0/b/ejercimente-b02ab.appspot.com/o/iconos%2Ftutorial.png?alt=media&token=62cc5f8d-75fc-44db-bc71-bbb34f01e926'
            )
          ],
        ),
      ),
      PageViewModel(
        title: 'HOLA',
        bodyWidget: Column(
          children: [
            Image.network(
                'https://firebasestorage.googleapis.com/v0/b/ejercimente-b02ab.appspot.com/o/iconos%2Ftutorial.png?alt=media&token=62cc5f8d-75fc-44db-bc71-bbb34f01e926'
            )
          ],
        ),
      ),
      PageViewModel(
        title: 'HOLA',
        bodyWidget: Column(
          children: [
            Image.network(
                'https://firebasestorage.googleapis.com/v0/b/ejercimente-b02ab.appspot.com/o/iconos%2Ftutorial.png?alt=media&token=62cc5f8d-75fc-44db-bc71-bbb34f01e926'
            )
          ],
        ),
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