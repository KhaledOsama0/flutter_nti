import 'package:bmi_calculater/core/shared/app_colors.dart';
import 'package:bmi_calculater/core/shared/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class GenderItem extends StatelessWidget {
  const GenderItem({
    super.key,
    required this.text,
    required this.icon,
    required this.onTap,
    this.isSelected = false,
    this.selectedColor = Colors.blue,
  });
  final String text;
  final IconData icon;
  final VoidCallback onTap;
  final bool isSelected;
  final Color selectedColor;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 140,
        height: 170,
        
        decoration: BoxDecoration(
          color: isSelected ? selectedColor : AppColors.secondary,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Gap(10),
            Icon(icon, color: Colors.white, size: 60),
            Gap(5),
            CustomText(
              text: text,
              color: Colors.white,
              size: 26,
              weight: FontWeight.bold,
            ),
          ],
        ),
      ),
    );
  }
}
