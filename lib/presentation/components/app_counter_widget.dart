import 'package:flutter/material.dart';
import 'package:online_shop/presentation/components/buttons/app_button.dart';
import 'package:online_shop/presentation/utils/theme/app_styles.dart';

/// App Counter Widget
class AppCounterWidget extends StatelessWidget {
  /// Default constructor
  const AppCounterWidget({
    super.key,
    required this.value,
    required this.onCountChanged,
  });

  /// Counter value
  final int value;

  /// Count changed callback
  final ValueChanged<int> onCountChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppButton.filled(
          text: '-',
          width: 50,
          onTap: () {
            if (value > 0) {
              onCountChanged(value - 1);
            }
          },
        ),
        SizedBox(
          width: 20,
          child: Center(
            child: Text(
              value.toString(),
              style: AppStyles.regularBigStyle(),
            ),
          ),
        ),
        AppButton.filled(
          width: 50,
          text: '+',
          onTap: () {
            if (value < 99) {
              onCountChanged(value + 1);
            }
          },
        ),
      ],
    );
  }
}
