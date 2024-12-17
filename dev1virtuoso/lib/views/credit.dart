import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:dev1virtuoso/widgets/paragraph_widget.dart';
import 'package:dev1virtuoso/widgets/data_table.dart';

class Credit extends StatelessWidget {
  const Credit({Key? key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var t = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(t.pageCreditTitle),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0), // Padding around the column
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                t.creditTitle,
                style: theme.textTheme.titleMedium,
              ),
              CreditTable()
            ],
          ),
        ),
      ),
    );
  }
}
