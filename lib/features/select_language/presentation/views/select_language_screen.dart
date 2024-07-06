import 'package:arch1/features/select_language/export/select_language_export.dart';

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
                language: StringsManager.english),
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
                language: StringsManager.arabic),
          ],
        ),
      ),
    );
  }
}
