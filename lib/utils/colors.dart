import 'package:flutter/material.dart';

const Color yellow = Color(0xffFDC054);
const Color mediumYellow = Color.fromARGB(255, 238, 199, 136);
const Color darkYellow = Color.fromARGB(255, 218, 141, 65);
const Color transparentYellow = Color.fromRGBO(57, 65, 16, 0.69);
const Color darkGrey = Color(0xff202020);
const LinearGradient mainButton = LinearGradient(colors: [
  Color.fromRGBO(236, 60, 3, 1),
  Color.fromRGBO(234, 60, 3, 1),
  Color.fromRGBO(216, 78, 16, 1),
], begin: FractionalOffset.topCenter, end: FractionalOffset.bottomCenter);

const List<BoxShadow> shadow = [
  BoxShadow(color: Colors.black12, offset: Offset(0, 3), blurRadius: 6)
];

screenAwareSize(int size, BuildContext context) {
  double baseHeight = 640.0;
  return size * MediaQuery.of(context).size.height / baseHeight;
}

class AppColors {
//rental2 app

//rental app
  static const Color textColor = Color(0xFFccc7c5);
  static const Color mainColor = Color(0xFF89dad0);
  static const Color iconColor1 = Color(0xFFffd28d);
  static const Color iconColor2 = Color(0xFFfcab88);
  static const Color paraColor = Color(0xFF8f837f);
  static const Color buttonBackgroundColor = Color(0xFF89dad0);
  static const Color singColor = Color(0xFFa9a29f);
  static const Color titleColor = Color(0xFF5c524f);
  static const Color mainBlackColor = Color(0xFF332d2b);
  static const Color yellowColor = Color(0xFFffd379);
//rental app 2

}
  
  //app properties
  
