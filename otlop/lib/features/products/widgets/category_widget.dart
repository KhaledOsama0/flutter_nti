
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:otlop/core/shared/shared_widgets/custom_text.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({super.key, required this.image, required this.title});
  final String image;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 85,
          height: 85,
          child: Card(
            color: Colors.white,
            child: Center(
              child: Image.network(image, fit: BoxFit.cover,),
            ),
          ),
        ),
        Gap(5),
        CustomText(text: title),
      ],
    );
  }
}
