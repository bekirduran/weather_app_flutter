import 'package:flutter/material.dart';

class MyStyle{
  static final biggerFont = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
    fontFamily: "Noto Sans JP"
  );

  static final deggreFont = TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      fontFamily: "Noto Sans JP",
      color: Colors.black12
  );

  static final subTitle = TextStyle(
      fontSize: 25,
      fontWeight: FontWeight.w600,
      fontFamily: "Noto Sans JP",
      color: Colors.black45
  );

  static final details = TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w600,
      fontFamily: "Noto Sans JP",
      color: Colors.indigo.shade300
  );
  static final date = TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w900,
      fontFamily: "Noto Sans JP",
      color: Colors.blueGrey
  );
}