import 'package:bmi_calculater/core/shared/widgets/custom_text.dart';
import 'package:bmi_calculater/features/home/data/result_model.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';


class BmiResultWidget extends StatelessWidget {
  const BmiResultWidget({super.key, required this.bmi});

  final double bmi;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SfRadialGauge(
        axes: [
          RadialAxis(
            minimum: BmiStatus.gaugeMin,
            maximum: BmiStatus.gaugeMax,
            ranges: [
              for (final i in BmiStatus.all)
                GaugeRange(startValue: i.from, endValue: i.to, color: i.color),
            ],
            pointers: [
              NeedlePointer(
                value: bmi.clamp(BmiStatus.gaugeMin, BmiStatus.gaugeMax).toDouble(),
                enableAnimation: true,
                needleColor: Colors.white,
              ),
            ],
            annotations: [
              GaugeAnnotation(
                widget: CustomText(
                  text: bmi.toStringAsFixed(1),
                  weight: FontWeight.bold,
                  size: 30,
                ),
                angle: 90,
                positionFactor: 0.5,
              ),
            ],
          ),
        ],
      ),
    );
  }
}