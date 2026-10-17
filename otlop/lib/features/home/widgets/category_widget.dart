import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:otlop/core/shared/shared_widgets/custom_text.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({super.key, required this.image, required this.title});
  final String image;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 72,
          width: 72,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(16),color: Colors.white),
          child: Center(
            child: SvgPicture.asset(
              width: 18,
              height: 32,
              image,
            ),
          ),
        ),
        Gap(5),
        CustomText(text: title),
      ],
    );
  }
}
