import 'package:cacapp/screen/reports_screen.dart';
import 'package:flutter/material.dart';

class InfoTopBar extends StatelessWidget {
  const InfoTopBar({Key? key}) : super(key: key);

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
          title: Text('About CacApp'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                  'CacApp is an application created to report citizens\' pet faeces that have been left on public roads.\n\nCacApp is not intended as an official reporting method, but rather as a way to raise awareness among citizens, regardless of their nationality, religion or other personal aspects.\n\nIf you have any questions or suggestions regarding the application only, please do not hesitate to contact us via our feedback form. For all other communications, please contact the competent authority.'),
            ],
          ),
          actions: [
            TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text('Cerrar'))
          ],
        );
      },
    );
  }
}
