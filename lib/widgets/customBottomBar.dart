import 'package:ejercimente/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomBottomBar extends StatelessWidget {
  static const TextStyle customBottomBarStyle = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
    fontSize: 15,
  );

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: background_blue,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
            width: 130.5,
            height: 70,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.black, width: 2.0),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.calendar_month,
                    size: 30,
                    color: Colors.black,

                  ),
                  onPressed: () {
                  },
                ),
                const Text(
                  "CALENDARIO",
                  style: customBottomBarStyle,
                )
              ],
            ),
          ),
          Container(
            width: 130.5,
            height: 70,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.black, width: 2.0),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(
                    FontAwesomeIcons.child,
                    size: 30,
                    color: Colors.black,
                  ),
                  onPressed: () {
                  },
                ),
                const Text(
                  "EJERCICIOS",
                  style: customBottomBarStyle,
                )
              ],
            ),
          ),
          Container(
            width: 130.5,
            height: 70,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.black, width: 2.0),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.help,
                    size: 30,
                    color: Colors.black,
                  ),
                  onPressed: () {
                  },
                ),
                const Text(
                  "AYUDA",
                  style: customBottomBarStyle,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }


}