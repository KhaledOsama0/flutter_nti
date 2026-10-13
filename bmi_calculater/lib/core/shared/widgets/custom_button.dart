import 'package:bmi_calculater/core/shared/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.onPressed, required this.text, required this.color, this.width, this.height});
  final Function() onPressed;
  final String text;
  final Color color;
  final double ?width,height;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onPressed ,
      child: Container(
        width:width?? double.infinity,
        height:height?? 85,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: CustomText(
              text:text.toUpperCase(),
             weight: FontWeight.bold,
             size: 24,
             
            
          ),
        )
        ),
    );
  }
}