import 'package:flutter/material.dart';
import 'package:otlop/core/shared/shared_widgets/custom_text.dart';

class BrandWidget extends StatelessWidget {
  const BrandWidget({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      // height: 5,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),color: Colors.white),
      child: Center(child: CustomText(text: text, fontSize: 14, fontWeight: FontWeight.w600)),
    );
  }
}
