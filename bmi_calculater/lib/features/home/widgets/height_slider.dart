import 'package:bmi_calculater/core/shared/app_colors.dart';
import 'package:bmi_calculater/core/shared/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class HeightSlider extends StatelessWidget {
  const HeightSlider({super.key, required this.value, this.onChanged});

  final double value;

  final ValueChanged<dynamic>? onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        decoration: BoxDecoration(
          color: AppColors.secondary,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: const [
                CustomText(
                  text: "HEIGHT",
                  color: Colors.white,
                  weight: FontWeight.bold,
                  size: 22,
                ),
                Gap(2),
                CustomText(
                  text: "cm",
                  color: Colors.white,
                  weight: FontWeight.normal,
                  size: 16,
                ),
              ],
            ),
            Gap(50),
      
            SfSliderTheme(
              data: SfSliderThemeData(
                activeTrackHeight: 2,
                inactiveTrackHeight: 2,
                activeTrackColor: Colors.purpleAccent,
                inactiveTrackColor: Colors.grey,
                thumbColor: Colors.red,
                thumbRadius: 6,
                overlayRadius: 14,
                overlayColor: Colors.red.withOpacity(0.2),
                tooltipBackgroundColor: Colors.red,
                tooltipTextStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
              child: SfSlider(
                min: 30,
                max: 250,
                value: value,
                stepSize: 1,
                enableTooltip: true,
                shouldAlwaysShowTooltip: true,
                tooltipShape: const SfPaddleTooltipShape(),
                onChanged: onChanged,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
