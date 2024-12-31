import 'package:flutter/material.dart';

class ResponsiveCardWidget extends StatelessWidget {
  const ResponsiveCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(10.0),
        constraints: BoxConstraints(maxWidth: 400.0),
        decoration: BoxDecoration(
          color: Colors.grey[800],
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(color: Colors.grey.withAlpha(128), blurRadius: 10.0),
          ],
        ),
        padding: EdgeInsets.all(20.0),
        transform: Matrix4.translationValues(0.0, -5.0, 0.0),
      ),
    );
  }
}
