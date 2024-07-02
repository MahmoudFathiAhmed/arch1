
import 'package:arch1/core/utils/colors_manager.dart';
import 'package:arch1/core/utils/font_manager.dart';
import 'package:arch1/core/utils/styles_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextStyles{
  static TextStyle font24GreenBold(double size, Color color) {
    return getBoldStyle(color: ColorsManager.green,fontSize: FontSize.s24.sp);
  }
}