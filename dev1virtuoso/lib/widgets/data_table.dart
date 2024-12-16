import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DataTableClass extends StatelessWidget {
  const DataTableClass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;

    return Table(
      border: TableBorder.all(),
      children: [
        TableRow(
          children: [
            TableCell(child: Text(t.personalInfo1)),
            TableCell(child: Text(t.personalInfo1Context)),
          ],
        ),
        TableRow(
          children: [
            TableCell(child: Text(t.personalInfo2)),
            TableCell(child: Text(t.personalInfo2Context)),
          ],
        ),
        TableRow(
          children: [
            TableCell(child: Text(t.personalInfo3)),
            TableCell(child: Text(t.personalInfo3Context)),
          ],
        ),
        TableRow(
          children: [
            TableCell(child: Text(t.personalInfo4)),
            TableCell(child: Text(t.personalInfo4Context)),
          ],
        ),
        TableRow(
          children: [
            TableCell(
              child: Text(
                t.personalInfo5,
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
            TableCell(
              child: Text(
                t.personalInfo5Context,
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
          ],
        ),
        TableRow(
          children: [
            TableCell(
              child: Text(
                t.personalInfo6,
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
            TableCell(
              child: Text(
                t.personalInfo6Context,
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
          ],
        ),
        TableRow(
          children: [
            TableCell(child: Text(t.personalInfo7)),
            TableCell(child: Text(t.personalInfo7Context)),
          ],
        ),
        TableRow(
          children: [
            TableCell(
              child: Text(
                t.personalInfo8,
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
            TableCell(
              child: Text(
                t.personalInfo8Context,
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
          ],
        ),
        TableRow(
          children: [
            TableCell(child: Text(t.personalInfo9)),
            TableCell(child: Text(t.personalInfo9Context)),
          ],
        ),
        TableRow(
          children: [
            TableCell(child: Text(t.personalInfo10)),
            TableCell(child: Text(t.personalInfo10Context)),
          ],
        ),
        TableRow(
          children: [
            TableCell(child: Text(t.personalInfo11)),
            TableCell(child: Text(t.personalInfo11Context)),
          ],
        ),
        TableRow(
          children: [
            TableCell(child: Text(t.personalInfo12)),
            TableCell(child: Text(t.personalInfo12Context)),
          ],
        ),
        TableRow(
          children: [
            TableCell(child: Text(t.personalInfo13)),
            TableCell(child: Text(t.personalInfo13Context)),
          ],
        ),
        TableRow(
          children: [
            TableCell(child: Text(t.personalInfo14)),
            TableCell(child: Text(t.personalInfo14Context)),
          ],
        ),
        TableRow(
          children: [
            TableCell(child: Text(t.personalInfo15)),
            TableCell(child: Text(t.personalInfo15Context)),
          ],
        ),
        TableRow(
          children: [
            TableCell(child: Text(t.personalInfo16)),
            TableCell(child: Image.asset('assets/images/sign.png')),
          ],
        ),
        TableRow(
          children: [
            TableCell(child: Text(t.personalInfo17)),
            TableCell(child: Text(t.personalInfo17Context)),
          ],
        ),
      ],
    );
  }
}
