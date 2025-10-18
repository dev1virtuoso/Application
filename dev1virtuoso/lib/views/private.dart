import 'package:flutter/material.dart';
import '/l10n/app_localizations.dart';

class Private extends StatelessWidget {
  const Private({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.pagePrivateTitle),
      ),
      body: const PrivateTabBar(),
    );
  }
}

class PrivateTabBar extends StatefulWidget {
  const PrivateTabBar({super.key});

  @override
  _PrivateTabBarState createState() => _PrivateTabBarState();
}

class _PrivateTabBarState extends State<PrivateTabBar> {
  final List<bool> _isExpanded = [false, false, false];
  final String _correctPassword = "1234";
  bool _isUnlocked = false;
  bool _hasShownDialog = false; // Prevents dialog reappearing unnecessarily

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_hasShownDialog && !_isUnlocked) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _showPasswordDialog();
      });
      _hasShownDialog = true;
    }
  }

  void _showPasswordDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        var t = AppLocalizations.of(context)!;
        String enteredPassword = "";
        final TextEditingController controller = TextEditingController();

        return AlertDialog(
          title: Text(t.pagePrivateTitle),
          content: TextField(
            controller: controller,
            obscureText: true,
            decoration: InputDecoration(
              labelText: t.enterPassword,
              errorText: null,
            ),
            onChanged: (value) {
              enteredPassword = value;
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                if (enteredPassword == _correctPassword) {
                  setState(() {
                    _isUnlocked = true;
                  });
                  Navigator.pop(context);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(t.wrongPassword)),
                  );
                }
              },
              child: Text(t.unlock),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pushNamed(
                  context,
                  '/home',
                );
              },
              child: Text(t.cancel),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    if (!_isUnlocked) {
      return const Center(child: CircularProgressIndicator());
    }

    var t = AppLocalizations.of(context)!;
    var theme = Theme.of(context);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          _buildExpansionCard(
            context,
            index: 0,
            title: t.helloWorld,
            isExpanded: _isExpanded[0],
            content: [
              const SizedBox(height: 20),
              Text(
                t.personalInfoTitle,
                style: theme.textTheme.titleSmall,
              ),
              const PersonalInfoTable(), // Assuming this is defined elsewhere
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildExpansionCard(
    BuildContext context, {
    required int index,
    required String title,
    required bool isExpanded,
    required List<Widget> content,
  }) {
    var theme = Theme.of(context);
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ExpansionTile(
        title: Text(
          title,
          style: theme.textTheme.titleMedium,
        ),
        trailing: Icon(
          isExpanded ? Icons.expand_less : Icons.expand_more,
        ),
        onExpansionChanged: (expanded) {
          setState(() {
            _isExpanded[index] = expanded;
          });
        },
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: content,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    // Clean up any resources if needed
    super.dispose();
  }
}

class PersonalInfoTable extends StatelessWidget {
  const PersonalInfoTable({super.key});

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
              TableCell(
                child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(t.personalInfoName)),
              ),
              TableCell(
                child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(t.personalInfoNameContext)),
              ),
            ],
          ),
          TableRow(
            children: [
              TableCell(
                child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(t.personalInfoCName)),
              ),
              TableCell(
                child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(t.personalInfoCNameContext)),
              ),
            ],
          ),
          TableRow(
            children: [
              TableCell(
                child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(t.personalInfoBorn)),
              ),
              TableCell(
                child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(t.personalInfoBornContext)),
              ),
            ],
          ),
          TableRow(
            children: [
              TableCell(
                child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(t.personalInfoEOL)),
              ),
              TableCell(
                child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(t.personalInfoEOLContext)),
              ),
            ],
          ),
          TableRow(
            children: [
              TableCell(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    t.personalInfoFavoriteActor,
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    t.personalInfoFavoriteActorContext,
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
              ),
            ],
          ),
          TableRow(
            children: [
              TableCell(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    t.personalInfoFavoriteBotanical,
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    t.personalInfoFavoriteBotanicalContext,
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
              ),
            ],
          ),
          TableRow(
            children: [
              TableCell(
                child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(t.personalInfoFavoriteColor)),
              ),
              TableCell(
                child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(t.personalInfoFavoriteColorContext)),
              ),
            ],
          ),
          TableRow(
            children: [
              TableCell(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    t.personalInfoFavoriteCeature,
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    t.personalInfoFavoriteCeatureContext,
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
              ),
            ],
          ),
          TableRow(
            children: [
              TableCell(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    t.personalInfoFavoriteInsecta,
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    t.personalInfoFavoriteInsectaContext,
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
              ),
            ],
          ),
          TableRow(
            children: [
              TableCell(
                child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(t.personalInfoFavoriteields)),
              ),
              TableCell(
                child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(t.personalInfoFavoriteieldsContext)),
              ),
            ],
          ),
          TableRow(
            children: [
              TableCell(
                child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(t.personalInfoGender)),
              ),
              TableCell(
                child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(t.personalInfoGenderContext)),
              ),
            ],
          ),
          TableRow(
            children: [
              TableCell(
                child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(t.personalInfoMBTI)),
              ),
              TableCell(
                child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(t.personalInfoMBTIContext)),
              ),
            ],
          ),
          TableRow(
            children: [
              TableCell(
                child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(t.personalInfoPI)),
              ),
              TableCell(
                child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(t.personalInfoPIContext)),
              ),
            ],
          ),
          TableRow(
            children: [
              TableCell(
                child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(t.personalInfoPronouns)),
              ),
              TableCell(
                child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(t.personalInfoPronounsContext)),
              ),
            ],
          ),
          TableRow(
            children: [
              TableCell(
                child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(t.personalInfoReligion)),
              ),
              TableCell(
                child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(t.personalInfoReligionContext)),
              ),
            ],
          ),
          TableRow(
            children: [
              TableCell(
                child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(t.personalInfoSO)),
              ),
              TableCell(
                child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(t.personalInfoSOContext)),
              ),
            ],
          ),
          TableRow(
            children: [
              TableCell(
                child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(t.personalInfoSignature)),
              ),
              TableCell(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Image(
                    image: AssetImage('assets/images/sign.png'),
                    width: 100.0,
                    height: 100.0,
                  ),
                ),
              ),
            ],
          ),
          TableRow(
            children: [
              TableCell(
                child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(t.personalInfoZS)),
              ),
              TableCell(
                child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(t.personalInfoZSContext)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
