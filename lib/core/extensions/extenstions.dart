import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

extension PixelAndDpConversionExtensions on BuildContext {
  /// convert dp to pixel
  double dpToPixel(double dp) {
    return dp * MediaQuery.of(this).devicePixelRatio;
  }
  /// convert pixel to dp
  double pixelToDp(double pixels) {
    return pixels / MediaQuery.of(this).devicePixelRatio;
  }
}

extension ContextExtensions on BuildContext {
  /// get screen height
  double get height => MediaQuery.sizeOf(this).height;
  /// get screen width
  double get width => MediaQuery.sizeOf(this).width;
}

extension NavigationExtesnions on BuildContext {
  /// push named route
  Future<dynamic> pushNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this).pushNamed(routeName, arguments: arguments);
  }
  /// push replacement named route
  Future<dynamic> pushReplacementNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this)
        .pushReplacementNamed(routeName, arguments: arguments);
  }
  /// push named and remove until
  Future<dynamic> pushNamedAndRemoveUntil(String routeName,
      {Object? arguments, required RoutePredicate predicate}) {
    return Navigator.of(this)
        .pushNamedAndRemoveUntil(routeName, predicate, arguments: arguments);
  }
  /// pop
  void pop() => Navigator.of(this).pop();
}

extension LanguageExtensions on BuildContext {
  /// determines if language is arabic?
  bool get isArabic => EasyLocalization.of(this)!.locale.languageCode == 'ar';
  /// determines if language is english
  bool get isEnglish => EasyLocalization.of(this)!.locale.languageCode == 'en';

  String get getLanguageCode => EasyLocalization.of(this)!.locale.languageCode;
}

extension StringExtensions on String? {
  /// check if string is null or empty
  bool isNullOrEmpty() => this == null || this == "";
}

extension ListExtensions<T> on List<T>? {
  /// check if list is null or empty
  bool isNullOrEmpty() => this == null || this!.isEmpty;

}

extension ParseToDoubleExtension on dynamic {
  double parseToDouble() {
    if (this == null) return 0.0;
    if (this is int) {
      return (this as int).toDouble();
    } else if (this is String) {
      return this.isNotEmpty ? double.tryParse(this) ?? 0.0 : 0.0;
    } else if (this is double) {
      return this;
    } else {
      throw ArgumentError('Unsupported type: $runtimeType');
    }
  }
}

