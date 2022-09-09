import 'dart:ui';
import 'package:flutter/material.dart';

class ColorConstant {
  // static Color deepOrange50 = fromHex('#f3e7e7');
  // static Color deepOrange50 = fromHex('#FEE6E3');
  static Color deepOrange50 = fromHex('#FDEDEF');

  static Color red600 = fromHex('#e63939');

  static Color lightBlueA100 = fromHex('#6ad1fd');

  static Color bluegray100 = fromHex('#d9d9d9');

  static Color amber300 = fromHex('#fbd54d');

  static Color black9003f = fromHex('#3f000000');

  static Color black90066 = fromHex('#66000000');

  static Color black900 = fromHex('#000000');

  static Color bluegray401 = fromHex('#888888');

  static Color bluegray400 = fromHex('#8f8e8e');

  static Color deepOrange300B2 = fromHex('#b2fa8072');

  static Color deepOrange300 = fromHex('#fa8072');

  static Color lightBlueA700 = fromHex('#0377ff');

  static Color whiteA700 = fromHex('#ffffff');

  static Color backGroundColor = fromHex('#ffffff');

  static Color grey = fromHex('#7e7e7e');

  static Color borderGrey = fromHex('#d9d9d9');

  static Color sendBlue = fromHex('#24a0ed');

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
