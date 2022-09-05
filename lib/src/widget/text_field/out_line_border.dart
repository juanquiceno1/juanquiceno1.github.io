import 'package:flutter/material.dart';

class OutLineBorder {
  OutlineInputBorder outline(double radius, double wi, Color color) =>
      OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(50)),
        borderSide: BorderSide(width: 1, color: color),
      );

  UnderlineInputBorder lineinpunt(
          Color color, double ancho, double bordeRadius) =>
      UnderlineInputBorder(
        borderSide: BorderSide(width: ancho, color: color),
      );
}
