import 'package:flutter/material.dart';

class BottomActionButton extends StatefulWidget {
  const BottomActionButton(
      {Key? key,
      required this.icon,
      required this.label,
      required this.color,
      required this.onPressed,
      required this.showNotification})
      : super(key: key);

  final String icon;
  final String label;
  final Color color;
  final VoidCallback? onPressed;
  final bool showNotification;

  @override
  State<BottomActionButton> createState() => _BottomActionButtonState();
}

class _BottomActionButtonState extends State<BottomActionButton> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        IconButton(
          icon: Stack(
            children: [
              Image(
                image: AssetImage('assets/images/button/${widget.icon}'),
                height: 20.0,
              ),
              Transform.translate(
                offset: Offset(15.0, -10.0),
                child: Visibility(
                  child: Icon(Icons.circle, color: Colors.red, size: 13),
                  visible: widget.showNotification,
                ),
              ),
            ],
          ),
          color: widget.color,
          onPressed: widget.onPressed,
        ),
        Text(widget.label),
      ],
    );
  }
}
