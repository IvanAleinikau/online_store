import 'package:flutter/material.dart';
import 'package:online_shop/presentation/utils/theme/app_palette.dart';

/// App loading widget
class AppLoadingWidget extends StatelessWidget {
  /// Default constructor
  const AppLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          color: Palette.primary,
        ),
      ),
    );
  }
}
