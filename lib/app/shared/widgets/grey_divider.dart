import 'package:flutter/material.dart';

class GreyDivider extends StatelessWidget {
  const GreyDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: Colors.grey[800],
    );
  }
}
