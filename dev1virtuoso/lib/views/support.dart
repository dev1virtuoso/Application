import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:dev1virtuoso/widgets/paragraph_widget.dart';

class Support extends StatelessWidget {
  const Support({Key? key});

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;
    var theme = Theme.of(context);
    var appVersion =
        'v0.0.3.9(027)(0039_027-161224a)'; // Placeholder for the application version
    var licence1 = 'MIT License';
    var licence2 = 'Copyright (c) 2023 - present Carson Wu';
    var licence3 =
        'Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge,publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:';
    var licence4 =
        'The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.';
    var licence5 =
        'THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.';

    return Scaffold(
      appBar: AppBar(
        title: Text(t.pageSupportTitle),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0), // Padding around the column
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                t.copyrightNoticeTitle,
                style: theme.textTheme.titleMedium,
              ),
              ParagraphWidget('1. ${t.copyrightNotice1}'),
              ParagraphWidget('2. ${t.copyrightNotice2}'),
              ParagraphWidget('3. ${t.copyrightNotice3}'),
              ParagraphWidget('4. ${t.copyrightNotice4}'),
              ParagraphWidget('5. ${t.copyrightNotice5}'),
              ParagraphWidget('6. ${t.copyrightNotice6}'),
              ParagraphWidget('7. ${t.copyrightNotice7}'),
              ParagraphWidget('8. ${t.copyrightNotice8}'),
              ParagraphWidget('9. ${t.copyrightNotice9}'),
              ParagraphWidget('10. ${t.copyrightNotice10}'),
              ParagraphWidget(t.copyrightNoticeContact),
              Text(
                t.mitLTitle,
                style: theme.textTheme.titleMedium,
              ),
              ParagraphWidget(t.mitLContent),
              Text(
                t.mitLAboutTitle,
                style: theme.textTheme.titleMedium,
              ),
              ParagraphWidget(t.mitLAboutContent),
              ParagraphWidget(t.mitLAboutContent2),
              Text(
                t.licenceTitle,
                style: theme.textTheme.titleMedium,
              ),
              ParagraphWidget(licence1),
              ParagraphWidget(licence2),
              ParagraphWidget(licence3),
              ParagraphWidget(licence4),
              ParagraphWidget(licence5),
              SizedBox(height: 20), // Add some spacing
              Text(
                '${t.appVersion}: $appVersion',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
