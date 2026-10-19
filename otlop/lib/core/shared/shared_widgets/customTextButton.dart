import 'package:flutter/material.dart';
import 'package:otlop/core/shared/colors/app_colors.dart';
import 'package:otlop/core/shared/shared_widgets/custom_text.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    required this.text,
    required this.onPressed,
     this.size,
  });
  final String text;
  final VoidCallback onPressed;
    final double? size;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: CustomText(
        text: text,
        fontWeight: FontWeight.w600,
        color: AppColors.primaryColor,
        fontSize: size??14,
      ),
    );
  }
}
