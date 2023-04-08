import 'package:flutter/material.dart';

class Layout {
  static double setWidth(BuildContext context, double percent) {
    return MediaQuery.of(context).size.width * (percent / 100);
  }

  static double setHeight(BuildContext context, double percent) {
    return MediaQuery.of(context).size.height * (percent / 100);
  }
}
