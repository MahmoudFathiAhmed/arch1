import 'package:arch1/core/shared_widgets/app_adaptive_dialog.dart';
import 'package:arch1/core/shared_widgets/empty_error_widget.dart';
import 'package:arch1/core/utils/colors_manager.dart';
import 'package:flutter/material.dart';

class AppErrorWidget extends StatelessWidget {
  final String description;
  final bool isDialog;
  const AppErrorWidget(
      {super.key, required this.description, this.isDialog = false,});

  @override
  Widget build(BuildContext context) {
    return isDialog
        ? DialogEmptyErrorWidget(
            description: description,
            isEmptyView: false,
          )
        : EmptyErrorWidget(
            description: description,
            isEmptyView: false,
          );
  }
}
Future<dynamic> appErrorDialog(BuildContext context, String description) {
  return appAdaptiveDialog(
    context,
    bgColor: ColorsManager.white,
    content: AppErrorWidget(
      description: description,
      isDialog: true,
    ),
  );
}
