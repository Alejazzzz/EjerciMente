import 'package:ejercimente/models/TileModel.dart';

String selectedTile = "";
int? selectedIndex;
bool selected = true;
int points = 0;

List<TileModel> myPairs = [];
List<bool> clicked = [];

List<bool> getClicked() {
  List<bool> yoClicked = [];
  List<TileModel> myPairs = getPairs();
  for (int i = 0; i < myPairs.length; i++) {
    yoClicked.add(false);
  }
  return yoClicked;
}

List<TileModel> getPairs() {
  List<TileModel> pairs = [];

  TileModel tileModel = TileModel();

  //1
  tileModel.setImageAssetPath("assets/fox.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);
  tileModel = TileModel();

  //2
  tileModel.setImageAssetPath("assets/hippo.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);
  tileModel = TileModel();

  //3
  tileModel.setImageAssetPath("assets/horse.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);
  tileModel = TileModel();

  //4
  tileModel.setImageAssetPath("assets/monkey.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);
  tileModel = TileModel();

  //5
  tileModel.setImageAssetPath("assets/panda.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);
  tileModel = TileModel();

  //6
  tileModel.setImageAssetPath("assets/parrot.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);
  tileModel = TileModel();

  //7
  tileModel.setImageAssetPath("assets/rabbit.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);
  tileModel = TileModel();

  //8
  tileModel.setImageAssetPath("assets/zoo.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);
  tileModel = TileModel();

  return pairs;
}

List<TileModel> getQuestionPairs() {
  List<TileModel> pairs = [];

  TileModel tileModel = TileModel();

  //1
  tileModel.setImageAssetPath("assets/question.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);
  tileModel = TileModel();

  //2
  tileModel.setImageAssetPath("assets/question.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);
  tileModel = TileModel();

  //3
  tileModel.setImageAssetPath("assets/question.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);
  tileModel = TileModel();

  //4
  tileModel.setImageAssetPath("assets/question.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);
  tileModel = TileModel();

  //5
  tileModel.setImageAssetPath("assets/question.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);
  tileModel = TileModel();

  //6
  tileModel.setImageAssetPath("assets/question.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);
  tileModel = TileModel();

  //7
  tileModel.setImageAssetPath("assets/question.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);
  tileModel = TileModel();

  //8
  tileModel.setImageAssetPath("assets/question.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);
  tileModel = TileModel();

  return pairs;
}