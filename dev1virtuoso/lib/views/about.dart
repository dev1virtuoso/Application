import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:dev1virtuoso/widgets/paragraph_widget.dart';

class About extends StatelessWidget {
  const About({Key? key});

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(t.pageAboutTitle),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0), // Padding around the column
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              ParagraphWidget(t.carsonWuIntroduction),
              ParagraphWidget(t.carsonWuBackground),
              ParagraphWidget(t.carsonWuPassion),
              ParagraphWidget(t.carsonWuSkills),
              ParagraphWidget(t.carsonWuProjects),
              ParagraphWidget(t.carsonWuLearning),
              ParagraphWidget(t.carsonWuFuture),
              ParagraphWidget(t.carsonWuCollaboration),
              SizedBox(height: 20), // Add some spacing
            ],
          ),
        ),
      ),
    );
  }
}
