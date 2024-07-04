import 'package:arch1/core/utils/assets_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EmptyErrorWidget extends StatelessWidget {
  final Widget? icon;
  final String? title;
  final String description;
  final bool isEmptyView;
  final bool hasButton;
  final String? buttonTxt;
  final ValueGetter<Future<bool>>? buttonClickListener;

  const EmptyErrorWidget(
      {this.icon,
      this.title,
      required this.description,
      this.isEmptyView = true,
      this.hasButton = false,
      this.buttonTxt,
      this.buttonClickListener,
      Key? key,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.bottomCenter,
        child: ScrollConfiguration(
            behavior: MyBehavior(),
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Container(
                height: .5.sh,
                margin: EdgeInsets.symmetric(vertical: 40.h, horizontal: 20.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        icon ??
                            SvgPicture.asset(
                              (isEmptyView
                                  ? ImageAssets.noContent
                                  : ImageAssets.error),
                              width: 80.w,
                              height: 80.w,
                            ),
                        // Icon(
                        //   (isEmptyView
                        //       ? Icons.text_snippet_sharp
                        //       : Icons.report),
                        //   size: 80.w,
                        //   color: Colors.grey,
                        // ),
                        SizedBox(
                          height: 15.h,
                        ),
                        if (title?.isNotEmpty == true)
                          Text(
                            title!,
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge!
                                .copyWith(color: Colors.black),
                          ).tr(),
                        if (title?.isNotEmpty == true)
                          SizedBox(
                            height: 10.h,
                          ),
                        Text(
                          description,
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(color: Colors.grey),
                        ).tr(),
                        SizedBox(
                          height: 20.h,
                        ),
                      ],
                    ),
                    if (hasButton)
                      ElevatedButton(
                          onPressed: buttonClickListener,
                          child: Text('$buttonTxt').tr()),
                    // LoadingButton(
                    //   buttonTxt: buttonTxt ??
                    //       (isEmptyView
                    //           ? AppLocalizations.of(context)!.start_shopping
                    //           : AppLocalizations.of(context)!.try_again),
                    //   onClick: buttonClickListener!,
                    // )
                  ],
                ),
              ),
            )));
  }
}

class DialogEmptyErrorWidget extends StatelessWidget {
  final Widget? icon;
  final String? title;
  final String description;
  final bool isEmptyView;
  final bool hasButton;
  final String? buttonTxt;
  final ValueGetter<Future<bool>>? buttonClickListener;

  const DialogEmptyErrorWidget(
      {this.icon,
        this.title,
        required this.description,
        this.isEmptyView = true,
        this.hasButton = false,
        this.buttonTxt,
        this.buttonClickListener,
        Key? key,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.bottomCenter,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Column(
              children: [
                icon ??
                    SvgPicture.asset(
                      (isEmptyView
                          ? ImageAssets.noContent
                          : ImageAssets.error),
                      width: 80.w,
                      height: 80.w,
                    ),
                SizedBox(
                  height: 15.h,
                ),
                if (title?.isNotEmpty == true)
                  Text(
                    title!,
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .headlineLarge!
                        .copyWith(color: Colors.black),
                  ).tr(),
                if (title?.isNotEmpty == true)
                  SizedBox(
                    height: 10.h,
                  ),
                Text(
                  description,
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: Colors.grey),
                ).tr(),
                SizedBox(
                  height: 20.h,
                ),
              ],
            ),
            if (hasButton)
              ElevatedButton(
                  onPressed: buttonClickListener,
                  child: Text('$buttonTxt').tr()),
          ],
        ));
  }
}
class MyBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}
