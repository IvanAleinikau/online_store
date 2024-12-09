import 'package:flutter/material.dart';
import 'package:online_shop/presentation/utils/theme/app_palette.dart';

/// SplashArea
class SplashArea extends StatelessWidget {
  /// Default constructor
  const SplashArea({
    super.key,
    this.child,
    required this.onTap,
    this.borderRadius,
    this.padding,
  });

  /// Circle constructor
  const SplashArea.circle({
    super.key,
    this.child,
    required this.onTap,
    this.borderRadius = const BorderRadius.all(Radius.circular(25)),
    this.padding,
  });

  /// Child
  final Widget? child;

  /// Callback function
  final VoidCallback? onTap;

  /// BorderRadius
  final BorderRadius? borderRadius;

  /// Padding
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Palette.transparent,
      child: InkWell(
        borderRadius: borderRadius ?? BorderRadius.circular(5),
        splashColor: Palette.grey500.withOpacity(0.3),
        hoverColor: Palette.grey500.withOpacity(0.3),
        highlightColor: Palette.grey500.withOpacity(0.2),
        onTap: onTap,
        child: Container(
          padding: padding,
          child: child,
        ),
      ),
    );
  }
}
