import 'package:flutter/material.dart';

double calculateBmi({required double heightCm, required int weightKg}) {
  final heightM = heightCm / 100;
  return weightKg / (heightM * heightM);
}

class BmiStatus {
  const BmiStatus({
    required this.label,
    required this.color,
    required this.from,
    required this.to,
    required this.maleMessage,
    required this.femaleMessage,
  });

  final String label;
  final Color color;
  final double from;
  final double to;
  final String maleMessage;
  final String femaleMessage;

  String message({required bool isMale}) => isMale ? maleMessage : femaleMessage;

  static const double gaugeMin = 10;
  static const double gaugeMax = 40;

  static const List<BmiStatus> all = [
    BmiStatus(
      label: 'نحافة',
      color: Colors.orange,
      from: gaugeMin,
      to: 18.5,
      maleMessage: 'محتاج تاكل يا بطل 😅',
      femaleMessage: 'محتاجة تاكلي يا ست البنات 😅',
    ),
    BmiStatus(
      label: 'مثالي',
      color: Colors.green,
      from: 18.5,
      to: 25,
      maleMessage: 'فل الفل يا نجم 👌',
      femaleMessage: 'هى دى الزوجة المثالية ولا بلاش 👌',
    ),
    BmiStatus(
      label: 'وزن زائد',
      color: Colors.yellow,
      from: 25,
      to: 30,
      maleMessage: 'خلى بالك يا باشا، محتاجين نخف أكل شوية 😂',
      femaleMessage: 'لا يا ملكة، لازم نخلى بالنا شوية ونخف أكل 😂',
    ),
    BmiStatus(
      label: 'سمنة',
      color: Colors.red,
      from: 30,
      to: gaugeMax,
      maleMessage: 'لازم دايت فوراً يا وحش 💀',
      femaleMessage: 'لازم دايت فوراً يا ملكة 💀',
    ),
  ];

  static BmiStatus fromBmi(double bmi) {
  if (bmi < 18.5) return all[0];
  else if (bmi < 25) return all[1];
  else if (bmi < 30) return all[2];
  return all[3];
}
}