import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';

class CustomExpandableText extends StatelessWidget {
  const CustomExpandableText({
    super.key,
    required this.text,
    required this.fontSize,
    required this.color,
    required this.fontWeight,
    required this.maxLine,
  });

  final String text;
  final double fontSize;
  final Color color;
  final FontWeight fontWeight;
  final int maxLine;

  @override
  Widget build(BuildContext context) {
    return ExpandableText(
      text,
      maxLines: maxLine,
      expandText: "Read more",
      collapseText: "Read lass",
      linkColor: Colors.deepOrange,
      style: TextStyle(
        fontSize: fontSize,
        color: color,
        fontWeight: fontWeight,
      ),
    );
  }
}
