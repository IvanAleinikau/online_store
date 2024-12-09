import 'package:flutter/material.dart';
import 'package:online_shop/presentation/components/splash_area.dart';
import 'package:online_shop/presentation/utils/theme/app_palette.dart';
import 'package:online_shop/presentation/utils/theme/app_styles.dart';

/// App Button
class AppButton extends StatelessWidget {
  /// Filled button
  const AppButton.filled({
    super.key,
    this.onTap,
    required this.text,
    this.borderRadius,
    this.buttonColor,
    this.titleColor,
    this.width,
    this.padding,
    this.verticalPadding,
  }) : type = ButtonType.filled;

  /// Outline button
  const AppButton.outline({
    super.key,
    this.onTap,
    required this.text,
    this.borderRadius,
    this.buttonColor,
    this.titleColor,
    this.width,
    this.padding,
    this.verticalPadding,
  }) : type = ButtonType.outline;

  /// Callback function
  final VoidCallback? onTap;

  /// Text
  final String text;

  /// Button Type
  final ButtonType type;

  /// BorderRadius
  final BorderRadius? borderRadius;

  /// Button color
  final Color? buttonColor;

  /// Title color
  final Color? titleColor;

  /// Button width
  final double? width;

  /// Button padding
  final EdgeInsetsGeometry? padding;

  /// Title vertical padding
  final double? verticalPadding;

  @override
  Widget build(BuildContext context) {
    final isInactive = onTap == null;
    final radius = borderRadius ?? BorderRadius.circular(10);

    final color = switch (isInactive) {
      true => buttonColor?.withOpacity(0.4) ?? Palette.primary.withOpacity(0.4),
      false => buttonColor ?? Palette.primary,
    };

    final textColor = switch (isInactive) {
      true => titleColor?.withOpacity(0.4),
      false => titleColor,
    };

    final filledTextColor = switch (isInactive) {
      true => Palette.white.withOpacity(0.8),
      false => Palette.white,
    };

    return Container(
      width: width,
      margin: padding,
      decoration: switch (type) {
        ButtonType.filled => BoxDecoration(
            color: color,
            borderRadius: radius,
          ),
        ButtonType.outline => BoxDecoration(
            border: Border.all(color: color, width: 2),
            borderRadius: radius,
          ),
      },
      child: SplashArea(
        onTap: onTap,
        borderRadius: radius,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: verticalPadding ?? 13),
          child: Text(
            text,
            style: AppStyles.regularBigStyle().copyWith(
              color: switch (type) {
                ButtonType.filled => textColor ?? filledTextColor,
                ButtonType.outline => textColor ?? color,
              },
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

/// ButtonType
enum ButtonType {
  /// Filled
  filled,

  /// Outline
  outline,
}
