import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.text,
    this.fontSize,
    this.fontWeight,
    this.color, this.maxLines, this.letterSpacing,
  });
  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final int? maxLines;
  final double? letterSpacing;

  @override
  Widget build(BuildContext context) {
    return Text(
      maxLines: maxLines??1,
      text,
      style: TextStyle(
        letterSpacing:letterSpacing?? 1,
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
      ),
      
      overflow: TextOverflow.ellipsis,
    );
  }
}
