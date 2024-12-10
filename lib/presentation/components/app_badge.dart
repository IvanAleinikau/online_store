import 'package:flutter/material.dart';
import 'package:online_shop/presentation/utils/theme/app_styles.dart';

/// App badge
class AppBadge extends StatelessWidget {
  /// Default constructor
  const AppBadge({
    super.key,
    required this.child,
    required this.amount,
  });

  /// Child
  final Widget child;

  /// Badge amount
  final int amount;

  @override
  Widget build(BuildContext context) {
    if (amount <= 0) return child;

    return Stack(
      children: <Widget>[
        child,
        Positioned(
          right: 0,
          child: Container(
            padding: const EdgeInsets.all(1),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(6),
            ),
            constraints: const BoxConstraints(
              minWidth: 12,
              minHeight: 12,
            ),
            child: Text(
              '$amount',
              style: AppStyles.regularCustomSizeStyle(
                color: Colors.white,
                fontSize: 8,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
