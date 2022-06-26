import 'package:flutter/material.dart';
import 'package:bluewave/core/app_export.dart';

class AppStyle {
  static TextStyle textstyleregular20 = TextStyle(
    color: ColorConstant.black900,
    fontSize: getFontSize(
      20,
    ),
    fontWeight: FontWeight.w400,
  );

  static TextStyle textstyleinterregular201 = textstyleinterregular154.copyWith(
    fontSize: getFontSize(
      20,
    ),
  );

  static TextStyle textstyleinterregular151 = textstyleinterregular154.copyWith(
    color: ColorConstant.bluegray400,
  );

  static TextStyle textstyleasapromanregular12 = TextStyle(
    color: ColorConstant.black90066,
    fontSize: getFontSize(
      12,
    ),
    fontFamily: 'Asap',
    fontWeight: FontWeight.w400,
  );

  static TextStyle textstyleinterregular152 = textstyleinterregular154.copyWith(
    color: ColorConstant.black900,
  );

  static TextStyle textstyleregular16 = TextStyle(
    color: ColorConstant.bluegray401,
    fontSize: getFontSize(
      16,
    ),
    fontWeight: FontWeight.w400,
  );

  static TextStyle textstyleinterregular155 =
      textstyleinterregular153.copyWith();

  static TextStyle textstyleinterregular153 = textstyleinterregular154.copyWith(
    color: ColorConstant.deepOrange300,
  );

  static TextStyle textstyleinterregular154 = TextStyle(
    color: ColorConstant.deepOrange300B2,
    fontSize: getFontSize(
      15,
    ),
    fontFamily: 'Inter',
    fontWeight: FontWeight.w400,
  );

  static TextStyle textstyleinterregular20 = textstyleinterregular153.copyWith(
    fontSize: getFontSize(
      20,
    ),
  );

  static TextStyle textstyleinterregular28 = TextStyle(
    color: ColorConstant.lightBlueA700,
    fontSize: getFontSize(
      28,
    ),
    fontFamily: 'Inter',
    fontWeight: FontWeight.w400,
  );

  static TextStyle textstyleinterregular15 = textstyleinterregular154.copyWith(
    color: ColorConstant.whiteA700,
  );
}
