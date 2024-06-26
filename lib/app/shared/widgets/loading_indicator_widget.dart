import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class LoadingIndicatorWidget extends StatelessWidget {
  const LoadingIndicatorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: const CircularProgressIndicator(
      color: Colors.white,
    ).animate().fadeIn(
              duration: const Duration(milliseconds: 1200),
            ));
  }
}
