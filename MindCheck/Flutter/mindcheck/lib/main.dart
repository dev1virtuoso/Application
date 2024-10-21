import 'package:flutter/material.dart';
import 'assessment_page.dart';

class MindCheck extends StatelessWidget {
  const MindCheck({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Assessment',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const AssessmentPage(),
    );
  }
}
