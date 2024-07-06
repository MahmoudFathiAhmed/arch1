
import 'package:arch1/core/utils/strings_manager.dart';
import 'package:flutter/material.dart';

enum LanguageType { english , arabic }

const String arabic = StringsManager.ar;
const String english = StringsManager.en;

const Locale arabicLocale=  Locale(StringsManager.ar);
const Locale englishLocale=Locale(StringsManager.en);

const String localizationPath='assets/translations';
extension LanguageTypeExtension on LanguageType {
  String getValue() {
    switch (this) {
      case LanguageType.english:
        return english;
      case LanguageType.arabic:
        return arabic;
    }
  }
}
