

import 'package:flutter/material.dart';
import 'package:flutter_firebase_quiz_app/core/constants/app_border_radius.dart';
import 'package:flutter_firebase_quiz_app/core/constants/app_colors.dart';
import 'package:flutter_firebase_quiz_app/core/constants/app_text_style.dart';
import 'package:flutter_firebase_quiz_app/core/constants/assets_paths.dart';
import 'package:flutter_firebase_quiz_app/core/utils/screen_size.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppButton extends StatelessWidget {
  final String? buttonText;
  final Color backGroundColor;
  late final Color _textColor;
  final String? iconPath;
  late final Color? _iconColor;
  final double? width;
  late final BoxBorder? _border;
  final void Function()? onTap;

  AppButton._({
    Key? key,
    this.onTap,
    this.iconPath,
    BoxBorder? border,
    Color? iconColor,
    this.width,
    required this.buttonText,
    required this.backGroundColor,
    required Color textColor,
  }) : super(key: key) {
    _border = border;
    _textColor = textColor;
    _iconColor = iconColor;
  }

  factory AppButton.standart({
    required Function() onTap,
    required String buttonText,
    bool isActive = true,
  }) {
    Color backgroundColor = AppColors.secondaryColor;
    if (!isActive) {
      backgroundColor = backgroundColor.withOpacity(.25);
    }

    return AppButton._(
      onTap: onTap,
      buttonText: buttonText,
      backGroundColor: backgroundColor,
      textColor: AppColors.white,
    );
  }

  factory AppButton.icon({
    required Function() onTap,
    required String iconPath,
    String? buttonText,
    Color? textColor,
    Color? borderColor,
    Color? backGroundColor,
    Color? iconColor,
    bool isActive = true,
  }) {
    Color incomingBackgroundColor = backGroundColor ?? Colors.transparent;
    Color incomingBorderColor = borderColor ?? AppColors.secondaryColor;
    Color incomingTextColor = textColor ?? AppColors.secondaryColor;

    if (!isActive) {
      incomingBorderColor = incomingBorderColor.withOpacity(.25);
      incomingTextColor = incomingTextColor.withOpacity(.25);
      incomingBackgroundColor = incomingBackgroundColor.withOpacity(.25);
      iconColor = iconColor?.withOpacity(.25) ?? Colors.transparent.withOpacity(.25);
    }

    return AppButton._(
      onTap: onTap,
      iconPath: iconPath,
      iconColor: iconColor,
      buttonText: buttonText,
      textColor: incomingTextColor,
      backGroundColor: incomingBackgroundColor,
      border: Border.all(color: incomingBorderColor),
    );
  }

  factory AppButton.outline({
    required Function() onTap,
    String? buttonText,
    Color? textColor,
    Color? borderColor,
    Color? backGroundColor,
    bool isActive = true,
  }) {
    Color incomingBackgroundColor = backGroundColor ?? Colors.white;
    Color incomingBorderColor = borderColor ?? AppColors.primaryColor;
    Color incomingTextColor = textColor ?? AppColors.primaryColor;

    if (!isActive) {
      incomingBorderColor = incomingBorderColor.withOpacity(.25);
      incomingTextColor = incomingTextColor.withOpacity(.25);
      incomingBackgroundColor = incomingBackgroundColor.withOpacity(.25);
    }

    return AppButton._(
      onTap: onTap,
      buttonText: buttonText,
      textColor: incomingTextColor,
      backGroundColor: incomingBackgroundColor,
      border: Border.all(color: incomingBorderColor),
    );
  }

  factory AppButton.small({
    required Function() onTap,
    String? buttonText,
    Color? textColor,
    Color? backGroundColor,
    bool isActive = true,
    double? width,
  }) {
    Color incomingBackgroundColor = backGroundColor ?? AppColors.primaryColor;
    Color incomingTextColor = textColor ?? AppColors.white;

    if (!isActive) {
      incomingTextColor = incomingTextColor.withOpacity(.25);
      incomingBackgroundColor = incomingBackgroundColor.withOpacity(.25);
    }

    return AppButton._(
      onTap: onTap,
      buttonText: buttonText,
      textColor: incomingTextColor,
      backGroundColor: incomingBackgroundColor,
      width: ScreenSize().getHeightPercent(.13),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 46,
        width: width,
        decoration: BoxDecoration(
          border: _border,
          color: backGroundColor,
          borderRadius: AppBorderRadius.borderRadiusAll_14px,
        ),
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Visibility(
              visible: iconPath != null,
              child: SvgPicture.asset(
                 iconPath ?? '',
                
                height: 24,
              color: _iconColor,
               
                
              
              ),
            ),
            if (buttonText != null) ...[
              SizedBox(
                height: 46,
                child: Center(
                  child: Text(
                    buttonText ?? "",
                    style: AppTextStyles.regular16px.copyWith(
                      color: _textColor,
                    ),
                  ),
                ),
              ),
            ],
            if (buttonText != null) ...[
              const SizedBox.shrink(),
            ],
          ],
        ),
      ),
    );
  }
}
