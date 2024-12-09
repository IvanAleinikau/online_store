import 'package:flutter/material.dart';

/// SizedBox Extension
extension SizedBoxExtension on num {
  /// SizedBox height
  SizedBox get height => SizedBox(height: toDouble());

  /// SizedBox width
  SizedBox get width => SizedBox(width: toDouble());
}
