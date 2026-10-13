import 'package:bmi_calculater/core/shared/app_colors.dart';
import 'package:bmi_calculater/core/shared/widgets/custom_button.dart';
import 'package:bmi_calculater/core/shared/widgets/custom_text.dart';
import 'package:bmi_calculater/features/home/screen/result_screen.dart';
import 'package:bmi_calculater/features/home/widgets/counter_item.dart';
import 'package:bmi_calculater/features/home/widgets/gender_item.dart';
import 'package:bmi_calculater/features/home/widgets/height_slider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool? isMale;
  double height = 150;
  int weight = 50;
  int age = 18;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: Center(
          child: CustomText(
            text: "BMI Calculator",
            size: 24,
            weight: FontWeight.bold,
          ),
        ),
      ),
      backgroundColor: AppColors.primary,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Gap(30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GenderItem(
                text: 'Male',
                icon: Icons.male,
                isSelected: isMale == true,
                selectedColor: Colors.blue,
                onTap: () => setState(() => isMale = true),
              ),
              GenderItem(
                text: 'Female',
                icon: Icons.female,
                isSelected: isMale == false,
                selectedColor: Colors.pink,
                onTap: () => setState(() => isMale = false),
              ),
            ],
          ),
          Gap(60),
          HeightSlider(
            value: height,
            onChanged: (v) => setState(() {
              height = v;
            }),
          ),
          Gap(60),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CounterItem(
                text: 'WIEGHT',
                number: weight,
                onAdd: () => setState(() => weight++),
                onSubtract: () => setState(() => weight--),
              ),
              CounterItem(
                text: 'Age',
                number: age,
                onAdd: () => setState(() => age++),
                onSubtract: () => setState(() => age--),
              ),
            ],
          ),
          Spacer(),
          CustomButton(
            color: switch (isMale) {
              true => Colors.blue,
              false => Colors.pink,
              null => AppColors.secondary, 
            },
            text: 'Calculate',
            onPressed: () {
              if (isMale == null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Please select your gender')),
                );
                return;
              }
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BmiResultScreen(
                    age: age,
                    height: height,
                    weight: weight,
                    isMale: isMale!,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
