import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:cacapp/util/extensions.dart';

import 'package:cacapp/screen/info_screen.dart';

class InfoTopBar extends StatefulWidget {
  const InfoTopBar({Key? key}) : super(key: key);

  @override
  State<InfoTopBar> createState() => _InfoTopBarState();
}

class _InfoTopBarState extends State<InfoTopBar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          icon: Image.asset('assets/images/button/back.png'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        Text(AppLocalizations.of(context)!.information.capitalize()),
        IconButton(
          icon: Image.asset('assets/images/button/feedback.png'),
          onPressed: () => _showAbout(context),
        ),
      ],
    );
  }

  void _showAbout(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          title: Center(child: Text('Feedback')),
          content: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.2,
            child: const TextField(
              keyboardType: TextInputType.multiline,
              textInputAction: TextInputAction.newline,
              expands: true,
              textAlignVertical: TextAlignVertical.top,
              maxLines: null,
              decoration: InputDecoration(
                  hintText: 'Please, enter your comments',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  )),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _showFeedbackSendt(context);
              },
              child: Text('Sent'),
            ),
          ],
        );
      },
    );
  }

  void _showFeedbackSendt(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: Center(child: Text('Feedback')),
          content: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Text(
                  'Thanks for your comments',
                  textAlign: TextAlign.center,
                ),
                Image(
                  image: AssetImage('assets/images/check-mark.png'),
                  height: 50,
                )
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.popUntil(
                  context, ModalRoute.withName(InfoScreen.route)),
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }
}
