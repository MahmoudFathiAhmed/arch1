import 'package:flutter/material.dart';

extension PixelToDpExtension on BuildContext {
  double pixelToDp(double pixels) {
    return pixels / MediaQuery.of(this).devicePixelRatio;
  }
}

extension DpToPixelExtension on BuildContext {
  double dpToPixel(double dp) {
    return dp * MediaQuery.of(this).devicePixelRatio;
  }
}