import 'package:flutter/material.dart';

const Color primaryColor = Color.fromRGBO(17, 120, 248, 1);
const Color secondaryColor = Color.fromRGBO(33, 32, 50, 1);
const Color hoverColor = Color.fromRGBO(51, 50, 68, 1);

class ConstantColor {
  static Color lightOrDarkColors(BuildContext context, Color? lightColor, Color? darkColor) {
    return Theme.of(context).brightness == Brightness.light ? lightColor! : darkColor!;
  }
}
