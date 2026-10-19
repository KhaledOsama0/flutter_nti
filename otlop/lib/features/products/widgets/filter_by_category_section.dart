import 'package:flutter/material.dart';
import 'package:otlop/core/shared/colors/app_colors.dart';
import 'package:otlop/features/products/widgets/product_tag_widget.dart';

class FilterByCategorySection extends StatelessWidget {
  const FilterByCategorySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ProductTagWidget(
          text: 'Relevance',
          backgroundColor: AppColors.primaryColor,
          textColor: Colors.white,
        ),
        ProductTagWidget(
          text: 'Price ↑',
          backgroundColor: Colors.white,
          textColor: Colors.black,
        ),
        ProductTagWidget(
          text: 'Price ↓',
          backgroundColor: Colors.white,
          textColor: Colors.black,
        ),
        ProductTagWidget(
          text: 'A – Z',
          backgroundColor: Colors.white,
          textColor: Colors.black,
        ),
      ],
    );
  }
}
