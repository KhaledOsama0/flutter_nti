import 'package:flutter/material.dart';
import 'package:otlop/core/shared/shared_widgets/custom_text.dart';

class ProductTagWidget extends StatelessWidget {
  const ProductTagWidget({
    super.key,
    required this.text,
    required this.backgroundColor,
    required this.textColor,
    this.width,
    this.height,
    this.fontSize,
  });
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final double? width, height, fontSize;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 88,
      height: height ?? 35,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 7,
            offset: const Offset(0, 1),
          ),
        ],
        borderRadius: BorderRadius.circular(16),
        color: backgroundColor,
      ),
      child: Center(
        child: CustomText(
          text: text,
          color: textColor,
          fontSize: fontSize ?? 14,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
