import 'package:ejercimente/screens/main_page.dart';
import 'package:ejercimente/screens/screen_template.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ejercimente/models/TileModel.dart';
import 'package:ejercimente/data/data.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../utils/constants.dart';

class CouplesPage extends StatefulWidget {
  @override
  _CouplesPageState createState() => _CouplesPageState();
}

class _CouplesPageState extends State<CouplesPage> {

  static const TextStyle pointsStyle = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
    fontSize: 25,
  );

  static const TextStyle labelStyle = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
    fontSize: 25,
  );

  static const TextStyle tittleStyle = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
    fontSize: 40,
  );

  List<TileModel> gridViewTiles = [];
  List<TileModel> questionPairs = [];

  @override
  void initState() {
    super.initState();
    points = 0;
    reStart();
  }

  void reStart() {
    myPairs = getPairs();
    myPairs.shuffle();

    gridViewTiles = myPairs;
    Future.delayed(const Duration(seconds: 20), () {
      setState(() {
        questionPairs = getQuestionPairs();
        gridViewTiles = questionPairs;
        selected = false;
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return ScreenTemplate(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
        child: Column(
          children: <Widget>[
            MySizedBox(40.0, 40.0),
            points != 800
                ? Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      "PUNTUACIÓN:",
                      textAlign: TextAlign.start,
                      style: pointsStyle,
                    ),
                    Text(
                      "$points/800",
                      style: pointsStyle
                    ),
                  ],
                )
                : Container(),
            MySizedBox(20.0, 20.0),
            points != 800
                ? GridView(
                  shrinkWrap: true,
                  //physics: ClampingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      mainAxisSpacing: 0.0, maxCrossAxisExtent: 100.0),
                  children: List.generate(gridViewTiles.length, (index) {
                    return Tile(
                      imagePathUrl: gridViewTiles[index].getImageAssetPath(),
                      tileIndex: index,
                      parent: this,
                    );
                  }),
                )
                : Container(
                  child: Column(
                    children: <Widget>[
                      MySizedBox(75, 75),
                      const Text(
                        "¡ENHORABUENA!\nQUE DESEA HACER AHORA",
                        style: tittleStyle,
                        textAlign: TextAlign.center,
                      ),
                      MySizedBox(50, 50),
                      GestureDetector(
                        onTap: (){
                          setState(() {
                            points = 0;
                            reStart();
                          });
                        },
                        child: Container(
                          width: 225.0,
                          height: 100.0,
                          decoration: BoxDecoration(
                            color: widgets_background_brown,
                            border: Border.all(color: Colors.black, width: 2.0),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              MySizedBox(20.0, 20.0),
                              const Icon(
                                FontAwesomeIcons.play,
                                size: 50,
                              ),
                              MySizedBox(20.0, 20.0),
                              const Text(
                                "OTRA\nPARTIDA",
                                style: labelStyle,
                                textAlign: TextAlign.center,
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20,),
                      GestureDetector(
                        onTap: (){
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => MainPage(),
                            ),
                          );
                        },
                        child: Container(
                          width: 225.0,
                          height: 100.0,
                          decoration: BoxDecoration(
                            color: widgets_background_brown,
                            border: Border.all(color: Colors.black, width: 2.0),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              MySizedBox(20.0, 20.0),
                              const Icon(
                                FontAwesomeIcons.home,
                                size: 50,
                              ),
                              MySizedBox(20.0, 20.0),
                              const Text(
                                "MENÚ\nPRINCIPAL",
                                style: labelStyle,
                                textAlign: TextAlign.center,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                )
          ],
        ),
      ),
    );
  }

  Widget MySizedBox(double w, double h) {
    return SizedBox(
      width: w,
      height: h,
    );
  }
}

class Tile extends StatefulWidget {
  String? imagePathUrl;
  int? tileIndex;
  _CouplesPageState? parent;

  Tile({this.imagePathUrl, this.tileIndex, this.parent});

  @override
  _TileState createState() => _TileState();
}

class _TileState extends State<Tile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!selected) {
          setState(() {
            myPairs[widget.tileIndex!].setIsSelected(true);
          });
          if (selectedTile != "") {
            if (selectedTile == myPairs[widget.tileIndex!].getImageAssetPath()) {
              points = points + 100;
              TileModel tileModel = new TileModel();
              selected = true;
              Future.delayed(const Duration(seconds: 1), () {
                tileModel.setImageAssetPath("");
                myPairs[widget.tileIndex!] = tileModel;
                myPairs[selectedIndex!] = tileModel;
                this.widget.parent?.setState(() {});
                setState(() {
                  selected = false;
                });
                selectedTile = "";
              });
            } else {
              selected = true;
              Future.delayed(const Duration(seconds: 1), () {
                this.widget.parent?.setState(() {
                  myPairs[widget.tileIndex!].setIsSelected(false);
                  myPairs[selectedIndex!].setIsSelected(false);
                });
                setState(() {
                  selected = false;
                });
              });

              selectedTile = "";
            }
          } else {
            setState(() {
              selectedTile = myPairs[widget.tileIndex!].getImageAssetPath()!;
              selectedIndex = widget.tileIndex!;
            });
          }
        }
      },
      child: Container(
        margin: EdgeInsets.all(5),
        child: myPairs[widget.tileIndex!].getImageAssetPath() != ""
            ? Image.asset(myPairs[widget.tileIndex!].getIsSelected()!
              ? myPairs[widget.tileIndex!].getImageAssetPath()!
              : widget.imagePathUrl!)
            : Container(
                child: Image.asset("assets/correct.png"),
               ),
      ),
    );
  }
}