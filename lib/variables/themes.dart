import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class Themes {
  static final bodyText2 = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w100,
    color: Color(0xFF070707),
  );
  static final dark = ThemeData.dark().copyWith(
    backgroundColor: Colors.black,
    buttonColor: Colors.red,
  );
}