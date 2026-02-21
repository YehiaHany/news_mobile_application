import 'package:flutter/material.dart';

extension MediaQueryValues on BuildContext {
  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;
  double calcOnWidth(double w) => MediaQuery.of(this).size.width * (w/393);
  double calcOnHeight(double h) => MediaQuery.of(this).size.height * (h/852);
}