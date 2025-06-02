import 'package:flutter/material.dart';

class ParagraphWidget extends StatelessWidget {
  final String text;

  const ParagraphWidget(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: 20.0, vertical: 16.0), // Adding padding on both sides
      child: Align(
        alignment: Alignment.topLeft,
        child: Text(
          text,
        ),
      ),
    );
  }
}
