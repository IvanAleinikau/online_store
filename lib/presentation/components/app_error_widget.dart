import 'package:flutter/material.dart';

/// App Error widget
class AppErrorWidget extends StatelessWidget {
  /// Default constructor
  const AppErrorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Something went wrong\nPlease, try later'),
      ),
    );
  }
}
