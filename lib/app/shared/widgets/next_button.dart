import 'package:flutter/material.dart';

class NextButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  const NextButton({super.key, required this.onPressed, this.text = "Dalej"});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: FilledButton(
          onPressed: onPressed,
          child: Text(
            text,
          )),
    );
  }
}
