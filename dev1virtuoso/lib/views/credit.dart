import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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

class CreditTable extends StatelessWidget {
  const CreditTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;

    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Table(
        border: TableBorder.all(),
        children: [
          TableRow(
            children: [
              TableCell(child: Text(t.creditInfoDesigner)),
              TableCell(child: Text(t.carsonwu)),
            ],
          ),
          TableRow(
            children: [
              TableCell(child: Text(t.creditInfoProgrammer)),
              TableCell(child: Text(t.carsonwu)),
            ],
          ),
          TableRow(
            children: [
              TableCell(child: Text(t.creditInfoHWS)),
              TableCell(child: Text(t.creditInfoHWSContext)),
            ],
          ),
          TableRow(
            children: [
              TableCell(child: Text(t.creditInfoBM)),
              TableCell(child: Text(t.creditInfoBMContext)),
            ],
          ),
        ],
      ),
    );
  }
}
