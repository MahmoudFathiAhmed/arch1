import 'package:arch1/core/extensions/extenstions.dart';
import 'package:arch1/core/helpers/app_preferences.dart';
import 'package:arch1/core/language/localization_helper.dart';
import 'package:arch1/core/services/service_locator.dart';
import 'package:arch1/features/select_language/presentation/widgets/language_element.dart';
import 'package:flutter/material.dart';

class SelectLanguageScreen extends StatelessWidget {
  const SelectLanguageScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    bool isEnglish = context.isEnglish;
    return SafeArea(
      child: Scaffold(
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 43),
          children: [
            LanguageElement(
                isSelected: isEnglish,
                checkBoxOnTap: !isEnglish
                    ? () async {
                        Future.wait([
                          // LocalizationHelper.changeToEnglish(context),
                          LocalizationHelper.changeLanguage(context),
                          getIt.get<AppPreferences>().changeAppLanguage(),
                        ]);
                      }
                    : null,
                language: 'english'),
            LanguageElement(
                isSelected: !isEnglish,
                checkBoxOnTap: isEnglish
                    ? () async {
                        Future.wait([
                          // LocalizationHelper.changeToArabic(context),
                          LocalizationHelper.changeLanguage(context),
                          getIt.get<AppPreferences>().changeAppLanguage(),
                        ]);
                      }
                    : null,
                language: 'arabic'),
          ],
        ),
      ),
    );
  }
}
