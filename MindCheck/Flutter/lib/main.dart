import 'package:flutter/material.dart';

class MultipleChoiceQuestionView extends StatefulWidget {
  final String question;
  final List<String> options;
  final Function(List<String>) callback;
  @override
  // ignore: overridden_fields
  final Key? key;

  const MultipleChoiceQuestionView({
    required this.question,
    required this.options,
    required this.callback,
    this.key,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MultipleChoiceQuestionViewState createState() =>
      _MultipleChoiceQuestionViewState();
}

class _MultipleChoiceQuestionViewState extends State<MultipleChoiceQuestionView> {
  List<String> selectedOptions = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(widget.question),
        const SizedBox(height: 8),
        ListView.builder(
          shrinkWrap: true,
          itemCount: widget.options.length,
          itemBuilder: (context, index) {
            String option = widget.options[index];
            return ListTile(
              title: Text(option),
              leading: Checkbox(
                value: selectedOptions.contains(option),
                onChanged: (value) {
                  setState(() {
                    if (value == true) {
                      selectedOptions.add(option);
                    } else {
                      selectedOptions.remove(option);
                    }
                  });
                },
              ),
            );
          },
        ),
        ElevatedButton(
          onPressed: () {
            widget.callback(selectedOptions);
          },
          child: const Text('Submit'),
        ),
      ],
    );
  }
}

class ScoreResult {
  final int score;
  final String riskLevel;

  ScoreResult(this.score, this.riskLevel);
}

int calculateTotalScore(List<String> responses) {
  int totalScore = 0;
  for (String response in responses) {
    totalScore += int.parse(response);
  }
  return totalScore;
}

ScoreResult getScoreResult(int score) {
  if (score >= 10 && score <= 14) {
    return ScoreResult(score, 'Mild');
  } else if (score >= 15 && score <= 19) {
    return ScoreResult(score, 'Moderate');
  } else if (score >= 20) {
    return ScoreResult(score, 'Severe');
  } else {
    return ScoreResult(score, 'None');
  }
}

void main() {
  runApp(const MindCheck());
}

class MindCheck extends StatelessWidget {
  const MindCheck({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Assessment',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AssessmentPage(),
    );
  }
}

// ignore: use_key_in_widget_constructors
class AssessmentPage extends StatelessWidget {
  final List<String> gad7Questions = [
    'Feeling nervous, anxious, or on edge',
    'Not being able to stop or control worrying',
    'Worrying too much about different things',
    'Trouble relaxing',
    'Being so restless that it is hard to sit still'
  ];

  final List<String> phq9Questions = [
    'Little interest or pleasure in doing things',
    'Feeling down, depressed, or hopeless',
    'Trouble falling or staying asleep, or sleeping too much',
    'Feeling tired or having little energy',
    'Poor appetite or overeating',
    'Feeling bad about yourself - or that you are a failure or have let yourself or your family down',
    'Trouble concentrating on things, such as reading the newspaper or watching television',
    'Moving or speaking so slowly that other people could have noticed?',
  ];

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}