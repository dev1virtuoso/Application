import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../model/locale.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;
    var selectedLocale = Localizations.localeOf(context).toString();

    return Scaffold(
      appBar: AppBar(
        title: Text(t.pageSettingsTitle),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                t.pageSettingsLanguageSelectionHeading,
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
            ),
            Consumer<LocaleModel>(
              builder: (context, localeModel, child) => DropdownButton<String>(
                value: selectedLocale,
                items: [
                  DropdownMenuItem(
                    value: "en",
                    child: Text(t.pageSettingsInputLanguage("en")),
                  ),
                  DropdownMenuItem(
                    value: "es",
                    child: Text(t.pageSettingsInputLanguage("es")),
                  ),
                  DropdownMenuItem(
                    value: "ar",
                    child: Text(t.pageSettingsInputLanguage("ar")),
                  ),
                ],
                onChanged: (String? value) {
                  if (value != null) {
                    localeModel.set(Locale(value));
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
