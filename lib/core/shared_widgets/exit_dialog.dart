import 'package:arch1/core/extensions/extenstions.dart';
import 'package:arch1/core/functions/exit_app.dart';
import 'package:arch1/core/shared_widgets/app_adaptive_dialog.dart';
import 'package:arch1/core/utils/strings_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

Future<dynamic> exitDialog(BuildContext context) {
  return appAdaptiveDialog(
    context,
    content: const Text(StringsManager.surExitApp).tr(),
    actions: [
      TextButton(
          onPressed: () {
            exitApp(context);
          },
          child: const Text(StringsManager.yes).tr()),
      TextButton(
          onPressed: () {
            context.pop();
          },
          child: const Text(StringsManager.no).tr()),
    ],
  );
}
/*
PopScope(
      onPopInvoked: (popInvocation) {
        exitDialog(context);
      }),
*/