import 'package:flutter/material.dart';

class ParagraphWidget extends StatelessWidget {
  final String text;

  const ParagraphWidget(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          bottom: 16.0), // Vertical space between paragraphs
      child: Text(
        text,
      ),
    );
  }
}
