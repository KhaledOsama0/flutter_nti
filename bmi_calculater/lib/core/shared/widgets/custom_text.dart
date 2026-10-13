import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.text,
    this.size,
    this.color,
    this.weight,
    this.align,
  });
  final String text;
  final double? size;
  final Color? color;
  final FontWeight? weight;
  final TextAlign? align;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size ?? 16,
        color: color ?? Colors.white,
        fontWeight: weight ?? FontWeight.normal,
      ),
      textAlign: align,
    );
  }
}
