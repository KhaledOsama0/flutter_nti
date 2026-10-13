import 'package:bmi_calculater/core/shared/app_colors.dart';
import 'package:bmi_calculater/core/shared/widgets/custom_button.dart';
import 'package:bmi_calculater/core/shared/widgets/custom_text.dart';
import 'package:bmi_calculater/features/home/data/result_model.dart';
import 'package:bmi_calculater/features/home/widgets/bmi_result_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';



class BmiResultScreen extends StatelessWidget {
  const BmiResultScreen({
    super.key,
    required this.age,
    required this.height,
    required this.weight,
    required this.isMale,
  });

  final int age;
  final double height;
  final int weight;
  final bool isMale;

  @override
  Widget build(BuildContext context) {
    final bmi = calculateBmi(heightCm: height, weightKg: weight);
    final status = BmiStatus.fromBmi(bmi);

    return Scaffold(
      backgroundColor:AppColors.primary,
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.transparent,
        title: Center(child: const CustomText(text:'BMI Result',color: Colors.white,weight: FontWeight.bold,size: 22,)),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BmiResultWidget(bmi: bmi),
          CustomText(
            text: status.label,
            color: status.color,
            weight: FontWeight.bold,
            size: 28,
          ),
          const Gap(10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: CustomText( 
              text: status.message(isMale: isMale),
              weight: FontWeight.bold,
              size: 22,
            ),
          ),
          const Gap(30),
          CustomButton(
            width: 300,
            height: 50,
            onPressed: () {Navigator.pop(context);}, text: 'Back to Home', color:isMale?Colors.blue:Colors.pink,)
        ],
      ),
    );
  }
}