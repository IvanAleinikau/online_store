import 'package:flutter/material.dart';
import 'package:online_shop/presentation/utils/theme/app_palette.dart';

/// App TextStyles
abstract class AppStyles {
  /// A size of textStyle is equel to some word:
  /// 10 - tiny
  /// 12 - small
  /// 14 - normal
  /// 16 - big
  /// 18 - huge
  /// other - irregular
  static TextStyle _baseFont({
    FontWeight fontWeight = FontWeight.normal,
    FontStyle fontStyle = FontStyle.normal,
    Color color = Palette.black,
    double fontSize = 16,
    double? letterSpacing,
    TextOverflow? overflow,
    double? height,
  }) {
    return TextStyle(
      color: color,
      fontSize: fontSize,
      fontFamily: 'Manrope',
      fontStyle: fontStyle,
      fontWeight: fontWeight,
      letterSpacing: letterSpacing,
      overflow: overflow,
      height: height ?? 1,
    );
  }

  /// FontSize = 10
  static TextStyle regularTinyStyle({
    FontWeight fontWeight = FontWeight.normal,
    Color color = Palette.black,
    double? letterSpacing,
    TextOverflow? overflow,
    double? height,
  }) =>
      _baseFont(
        fontSize: 10,
        color: color,
        fontWeight: fontWeight,
        letterSpacing: letterSpacing,
        overflow: overflow,
        height: height,
      );

  /// FontSize = 12
  static TextStyle regularSmallStyle({
    FontWeight fontWeight = FontWeight.normal,
    Color color = Palette.black,
    double? letterSpacing,
    TextOverflow? overflow,
    double? height,
  }) =>
      _baseFont(
        fontSize: 12,
        color: color,
        fontWeight: fontWeight,
        letterSpacing: letterSpacing,
        overflow: overflow,
        height: height,
      );

  /// FontSize = 14
  static TextStyle regularNormalStyle({
    FontWeight fontWeight = FontWeight.normal,
    Color color = Palette.black,
    double? letterSpacing,
    TextOverflow? overflow,
    double? height,
  }) =>
      _baseFont(
        fontSize: 14,
        color: color,
        fontWeight: fontWeight,
        letterSpacing: letterSpacing,
        overflow: overflow,
        height: height,
      );

  /// FontSize = 16
  static TextStyle regularBigStyle({
    FontWeight fontWeight = FontWeight.normal,
    Color color = Palette.black,
    double? letterSpacing,
    TextOverflow? overflow,
    double? height,
  }) =>
      _baseFont(
        color: color,
        fontWeight: fontWeight,
        letterSpacing: letterSpacing,
        overflow: overflow,
        height: height,
      );

  /// FontSize = 18
  static TextStyle regularHugeStyle({
    FontWeight fontWeight = FontWeight.normal,
    Color color = Palette.black,
    double? letterSpacing,
    TextOverflow? overflow,
    double? height,
  }) =>
      _baseFont(
        fontSize: 18,
        color: color,
        fontWeight: fontWeight,
        letterSpacing: letterSpacing,
        overflow: overflow,
        height: height,
      );

  /// FontSize = any size
  static TextStyle regularCustomSizeStyle({
    double fontSize = 20,
    FontWeight fontWeight = FontWeight.normal,
    Color color = Palette.black,
    double? letterSpacing,
    TextOverflow? overflow,
    double? height,
  }) =>
      _baseFont(
        fontSize: fontSize,
        color: color,
        fontWeight: fontWeight,
        letterSpacing: letterSpacing,
        overflow: overflow,
        height: height,
      );
}
