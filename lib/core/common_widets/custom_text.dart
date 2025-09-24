import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.text,
    required this.size,
    this.color = Colors.black12,
    this.fontWeight,
    this.align = TextAlign.center,
    this.maxLine = 2,
    this.overflow = TextOverflow.ellipsis,
  });

  final String text;
  final double size;
  final Color color;
  final FontWeight? fontWeight;
  final TextAlign align;
  final int maxLine;
  final TextOverflow overflow;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: size, fontWeight: fontWeight, color: color),
      textAlign: align,
      maxLines: maxLine,
      overflow: overflow,
    );
  }
}
