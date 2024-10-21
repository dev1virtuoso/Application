import 'package:flutter/material.dart';

class MultipleChoiceQuestionView extends StatefulWidget {
  final String question;
  final List<String> options;
  final Function(List<String>) callback;
  final Key? key;

  const MultipleChoiceQuestionView({
    required this.question,
    required this.options,
    required this.callback,
    this.key,
  }) : super(key: key);

  @override
  _MultipleChoiceQuestionViewState createState() =>
      _MultipleChoiceQuestionViewState();
}

class _MultipleChoiceQuestionViewState
    extends State<MultipleChoiceQuestionView> {
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
