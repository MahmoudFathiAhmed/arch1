
import 'package:arch1/features/select_language/export/select_language_export.dart';
//modify styles and colos
class LanguageElement extends StatelessWidget {
  final bool isSelected;
  final VoidCallback? checkBoxOnTap;
  final String language;

  const LanguageElement(
      {super.key,
        required this.isSelected,
        required this.checkBoxOnTap, required this.language,
      });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: checkBoxOnTap,
      child: Container(
        height: AppDouble.d52,
        padding: const EdgeInsets.symmetric(horizontal: AppDouble.d16, vertical: AppDouble.d14),
        margin: const EdgeInsets.only(bottom: AppDouble.d8),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(AppDouble.d10),
            border: Border.all(
                color: Colors.grey)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: AppDouble.d24,
                  width: AppDouble.d24,
                  decoration: BoxDecoration(
                      color:
                      isSelected ? Colors.green : Colors.white,
                      shape: BoxShape.circle,
                      border: Border.all(
                          color: isSelected
                              ? Colors.green
                              : Colors.grey)),
                  child: isSelected
                      ? const Icon(
                    Icons.check,
                    color: Colors.white,
                    size: AppDouble.d14,
                  )
                      : const SizedBox(),
                ),
                const SizedBox(width: AppDouble.d11),
                Text(
                  language,
                  // style: ,
                ).tr(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}