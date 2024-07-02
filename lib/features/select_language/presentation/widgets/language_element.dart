
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
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
        height: 52,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        margin: const EdgeInsets.only(bottom: 8),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
                color: Colors.grey)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 24,
                  width: 24,
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
                    size: 14,
                  )
                      : const SizedBox(),
                ),
                const SizedBox(width: 11),
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