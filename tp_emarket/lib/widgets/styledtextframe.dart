import 'package:flutter/material.dart';

class StyledTextFrame extends StatelessWidget {
  final String text;
  final Color frameColor;
  final Color backgroundColor;
  final EdgeInsetsGeometry padding;

  const StyledTextFrame({
    Key? key,
    required this.text,
    this.frameColor = Colors.grey,
    this.backgroundColor = Colors.white,
    this.padding = const EdgeInsets.all(8.0),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: frameColor),
        color: backgroundColor,
      ),
      padding: padding,
      child: Text(
        text,
        style: TextStyle(fontSize: 16),
      ),
    );
  }
}
