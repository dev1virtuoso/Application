import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PersonalInfoTable extends StatelessWidget {
  const PersonalInfoTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;

    return Table(
      border: TableBorder.all(),
      children: [
        TableRow(
          children: [
            TableCell(child: Text(t.personalInfoName)),
            TableCell(child: Text(t.personalInfoNameContext)),
          ],
        ),
        TableRow(
          children: [
            TableCell(child: Text(t.personalInfoCName)),
            TableCell(child: Text(t.personalInfoCNameContext)),
          ],
        ),
        TableRow(
          children: [
            TableCell(child: Text(t.personalInfoBorn)),
            TableCell(child: Text(t.personalInfoBornContext)),
          ],
        ),
        TableRow(
          children: [
            TableCell(child: Text(t.personalInfoEOL)),
            TableCell(child: Text(t.personalInfoEOLContext)),
          ],
        ),
        TableRow(
          children: [
            TableCell(
              child: Text(
                t.personalInfoFActor,
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
            TableCell(
              child: Text(
                t.personalInfoFActorContext,
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
          ],
        ),
        TableRow(
          children: [
            TableCell(
              child: Text(
                t.personalInfoFBotanical,
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
            TableCell(
              child: Text(
                t.personalInfoFBotanicalContext,
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
          ],
        ),
        TableRow(
          children: [
            TableCell(child: Text(t.personalInfoFColor)),
            TableCell(child: Text(t.personalInfoFColorContext)),
          ],
        ),
        TableRow(
          children: [
            TableCell(
              child: Text(
                t.personalInfoFCeature,
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
            TableCell(
              child: Text(
                t.personalInfoFCeatureContext,
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
          ],
        ),
        TableRow(
          children: [
            TableCell(child: Text(t.personalInfoFields)),
            TableCell(child: Text(t.personalInfoFieldsContext)),
          ],
        ),
        TableRow(
          children: [
            TableCell(child: Text(t.personalInfoGender)),
            TableCell(child: Text(t.personalInfoGenderContext)),
          ],
        ),
        TableRow(
          children: [
            TableCell(child: Text(t.personalInfoMBTI)),
            TableCell(child: Text(t.personalInfoMBTIContext)),
          ],
        ),
        TableRow(
          children: [
            TableCell(child: Text(t.personalInfoPI)),
            TableCell(child: Text(t.personalInfoPIContext)),
          ],
        ),
        TableRow(
          children: [
            TableCell(child: Text(t.personalInfoPronouns)),
            TableCell(child: Text(t.personalInfoPronounsContext)),
          ],
        ),
        TableRow(
          children: [
            TableCell(child: Text(t.personalInfoReligion)),
            TableCell(child: Text(t.personalInfoReligionContext)),
          ],
        ),
        TableRow(
          children: [
            TableCell(child: Text(t.personalInfoSO)),
            TableCell(child: Text(t.personalInfoSOContext)),
          ],
        ),
        TableRow(
          children: [
            TableCell(child: Text(t.personalInfoSignature)),
            TableCell(child: Image.asset('assets/images/sign.png')),
          ],
        ),
        TableRow(
          children: [
            TableCell(child: Text(t.personalInfoZS)),
            TableCell(child: Text(t.personalInfoZSContext)),
          ],
        ),
      ],
    );
  }
}

class CreditTable extends StatelessWidget {
  const CreditTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;

    return Table(border: TableBorder.all(), children: [
      TableRow(
        children: [
          TableCell(child: Text(t.creditInfoDesigner)),
          TableCell(child: Text('Carson Wu')),
        ],
      ),
      TableRow(
        children: [
          TableCell(child: Text(t.creditInfoProgrammer)),
          TableCell(child: Text('Carson Wu')),
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
    ]);
  }
}
