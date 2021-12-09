import 'package:cacapp/screen/info_screen_dart.dart';
import 'package:cacapp/screen/reports_screen.dart';
import 'package:cacapp/widget/bottom_action_button.dart';
import 'package:flutter/material.dart';

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
          icon: Icon(Icons.keyboard_arrow_left),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        Text('Information'),
        IconButton(
          icon: Image.asset(
            'assets/images/button/info.png',
            scale: 20,
          ),
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
          title: Center(child: Text('Feedback')),
          content: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.5,
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
              onPressed: () => _showFeedbackSendt(context),
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
            height: MediaQuery.of(context).size.height * 0.5,
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
