import 'package:flutter/material.dart';

class BelowButton extends StatelessWidget {
  final String text;
  final Function onPressed;

  const BelowButton({Key? key, required this.text, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
      child: SizedBox(
        width: double.infinity,
        child: FilledButton(
          onPressed: () => onPressed(),
          child: Text(text),
        ),
      ),
    );
  }
}
