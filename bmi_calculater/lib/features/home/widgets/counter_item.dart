import 'package:bmi_calculater/core/shared/app_colors.dart';
import 'package:bmi_calculater/core/shared/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CounterItem extends StatelessWidget {
  final String text;
  final int number;
  final VoidCallback onAdd;

  final VoidCallback onSubtract;

  const CounterItem({
    super.key,
    required this.text,
    required this.number,
    required this.onAdd,
    required this.onSubtract,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      height: 170,
      decoration: BoxDecoration(
        color: AppColors.secondary,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Gap(10),
          CustomText(text: text, weight: FontWeight.bold, size: 20),
          Gap(5),
          CustomText(
            text: number.toString(),
            size: 25,
            weight: FontWeight.bold,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton.filled(
                style: IconButton.styleFrom(backgroundColor: Colors.grey),
                onPressed: onSubtract,
                icon: const Icon(Icons.remove),
              ),
              IconButton.filled(
                style: IconButton.styleFrom(backgroundColor: Colors.grey),
                onPressed: onAdd,
                icon: const Icon(Icons.add),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
