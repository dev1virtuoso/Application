import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:dev1virtuoso/widgets/url_launcher.dart';

// PersonalInfo
class PersonalInfoTable extends StatelessWidget {
  const PersonalInfoTable({Key? key}) : super(key: key);

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
              TableCell(
                child: Image(
                  image: AssetImage('assets/images/sign.png'),
                  width: 100.0,
                  height: 100.0,
                ),
              ),
            ],
          ),
          TableRow(
            children: [
              TableCell(child: Text(t.personalInfoZS)),
              TableCell(child: Text(t.personalInfoZSContext)),
            ],
          ),
        ],
      ),
    );
  }
}

// Credit
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

// Contact
class ContactTable extends StatelessWidget {
  const ContactTable({Key? key}) : super(key: key);

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
                child: Text(t.contactDiscord),
              ),
              TableCell(
                child: InkWell(
                  onTap: () {
                    UrlLauncher.buildClickableLink(
                        'https://discord.com/users/893165893469732935');
                  },
                  child: UrlLauncher.buildBlueUnderlineText(t.contactDiscord),
                ),
              ),
            ],
          ),
          TableRow(
            children: [
              TableCell(child: Text(t.contactEmail)),
              TableCell(
                child: InkWell(
                  onTap: () {
                    UrlLauncher.buildClickableLink(
                        'mailto:carson.developer1125@gmail.com');
                  },
                  child: UrlLauncher.buildBlueUnderlineText(t.contactEmail),
                ),
              ),
            ],
          ),
          TableRow(
            children: [
              TableCell(child: Text(t.contactFacebook)),
              TableCell(
                child: InkWell(
                  onTap: () {
                    UrlLauncher.buildClickableLink(
                        'https://www.facebook.com/apple.we.98');
                  },
                  child: UrlLauncher.buildBlueUnderlineText(t.contactFacebook),
                ),
              ),
            ],
          ),
          TableRow(
            children: [
              TableCell(child: Text(t.contactGitHub)),
              TableCell(
                child: InkWell(
                  onTap: () {
                    UrlLauncher.buildClickableLink(
                        'https://github.com/dev1virtuoso');
                  },
                  child: UrlLauncher.buildBlueUnderlineText(t.contactGitHub),
                ),
              ),
            ],
          ),
          TableRow(
            children: [
              TableCell(child: Text(t.contactInstagram)),
              TableCell(
                child: InkWell(
                  onTap: () {
                    UrlLauncher.buildClickableLink(
                        'https://instagram.com/dev1virtuoso');
                  },
                  child: UrlLauncher.buildBlueUnderlineText(t.contactInstagram),
                ),
              ),
            ],
          ),
          TableRow(
            children: [
              TableCell(child: Text(t.contactKakaoTalk)),
              TableCell(child: Text('Carson1125')),
            ],
          ),
          TableRow(
            children: [
              TableCell(child: Text(t.contactViber)),
              TableCell(
                child: InkWell(
                  onTap: () {
                    UrlLauncher.buildClickableLink(
                        'viber://add?number=63078780');
                  },
                  child: UrlLauncher.buildBlueUnderlineText(t.contactViber),
                ),
              ),
            ],
          ),
          TableRow(
            children: [
              TableCell(child: Text(t.contactLINE)),
              TableCell(
                child: InkWell(
                  onTap: () {
                    UrlLauncher.buildClickableLink(
                        'https://line.me/ti/p/k4_I_vkqFZ');
                  },
                  child: UrlLauncher.buildBlueUnderlineText(t.contactLINE),
                ),
              ),
            ],
          ),
          TableRow(
            children: [
              TableCell(child: Text(t.contactLinkedIn)),
              TableCell(
                child: InkWell(
                  onTap: () {
                    UrlLauncher.buildClickableLink(
                        'https://www.linkedin.com/in/carson-wu-34a615325/');
                  },
                  child: UrlLauncher.buildBlueUnderlineText(t.contactLinkedIn),
                ),
              ),
            ],
          ),
          TableRow(
            children: [
              TableCell(child: Text(t.contactLinktree)),
              TableCell(
                child: InkWell(
                  onTap: () {
                    UrlLauncher.buildClickableLink(
                        'https://linktr.ee/carsonwe');
                  },
                  child: UrlLauncher.buildBlueUnderlineText(t.contactLinktree),
                ),
              ),
            ],
          ),
          TableRow(
            children: [
              TableCell(child: Text(t.contactORCID)),
              TableCell(
                child: InkWell(
                  onTap: () {
                    UrlLauncher.buildClickableLink(
                        'https://orcid.org/0009-0004-2238-8912');
                  },
                  child: UrlLauncher.buildBlueUnderlineText(t.contactORCID),
                ),
              ),
            ],
          ),
          TableRow(
            children: [
              TableCell(child: Text(t.contactPhone)),
              TableCell(
                child: InkWell(
                  onTap: () {
                    UrlLauncher.buildClickableLink('tel:85263078780');
                  },
                  child: UrlLauncher.buildBlueUnderlineText(t.contactPhone),
                ),
              ),
            ],
          ),
          TableRow(
            children: [
              TableCell(child: Text(t.contactReddit)),
              TableCell(
                child: InkWell(
                  onTap: () {
                    UrlLauncher.buildClickableLink(
                        'https://www.reddit.com/user/carson_we/');
                  },
                  child: UrlLauncher.buildBlueUnderlineText(t.contactReddit),
                ),
              ),
            ],
          ),
          TableRow(
            children: [
              TableCell(child: Text(t.contactSignal)),
              TableCell(
                child: InkWell(
                  onTap: () {
                    UrlLauncher.buildClickableLink(
                        'https://signal.me/#eu/os05Q0OzC3s1NRRYvDNmobxTzCq1SPfX0ReOgDSQQbju04OeyaRG3rHClOwaf_m2');
                  },
                  child: UrlLauncher.buildBlueUnderlineText(t.contactSignal),
                ),
              ),
            ],
          ),
          TableRow(
            children: [
              TableCell(child: Text(t.contactTelegram)),
              TableCell(
                child: InkWell(
                  onTap: () {
                    UrlLauncher.buildClickableLink(
                        'https://telegram.me/dev1virtuoso');
                  },
                  child: UrlLauncher.buildBlueUnderlineText(t.contactTelegram),
                ),
              ),
            ],
          ),
          TableRow(
            children: [
              TableCell(child: Text(t.contactThreads)),
              TableCell(
                child: InkWell(
                  onTap: () {
                    UrlLauncher.buildClickableLink(
                        'https://www.threads.net/@dev1virtuoso');
                  },
                  child: UrlLauncher.buildBlueUnderlineText(t.contactThreads),
                ),
              ),
            ],
          ),
          TableRow(
            children: [
              TableCell(child: Text(t.contactWhatsApp)),
              TableCell(
                child: InkWell(
                  onTap: () {
                    UrlLauncher.buildClickableLink('https://wa.me/63078780');
                  },
                  child: UrlLauncher.buildBlueUnderlineText(t.contactWhatsApp),
                ),
              ),
            ],
          ),
          TableRow(
            children: [
              TableCell(child: Text(t.contactTwitter)),
              TableCell(
                child: InkWell(
                  onTap: () {
                    UrlLauncher.buildClickableLink(
                        'https://x.com/dev1virtuoso/');
                  },
                  child: UrlLauncher.buildBlueUnderlineText(t.contactTwitter),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Donate
class DonateTable extends StatelessWidget {
  const DonateTable({Key? key}) : super(key: key);

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
                  child: Text(t.donateBMC),
                ),
              ),
              TableCell(
                child: InkWell(
                  onTap: () {
                    UrlLauncher.buildClickableLink(
                        'https://www.buymeacoffee.com/dev1virtuoso');
                  },
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(t.donateBMC),
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
                  child: Text(t.donateGHSP),
                ),
              ),
              TableCell(
                child: InkWell(
                  onTap: () {
                    UrlLauncher.buildClickableLink(
                        'https://github.com/sponsors/dev1virtuoso/');
                  },
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(t.donateGHSP),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
