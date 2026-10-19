import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:otlop/core/shared/colors/app_colors.dart';
import 'package:otlop/core/shared/shared_widgets/custom_text.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.price,
    this.onTap,
  });
  final String image, title, subtitle, price;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () {},
      child: Container(
        width: 162,
        height: 294,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
                child: Image.asset(
                  image,
                  fit: BoxFit.contain,
                  width: 155,
                  height: 167,
                ),
              ),
          
              Gap(7),
              CustomText(
                text: title,
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: AppColors.primaryColor,
              ),
              Gap(4),
          
              CustomText(
                maxLines: 2,
                text: subtitle,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
              Row(
                textBaseline: TextBaseline.alphabetic,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                children: [
                  CustomText(
                    text: price,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                  CustomText(
                    text: ' EGP',
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                    color: Colors.grey.shade400,
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.add, color: Colors.white),
                    style: IconButton.styleFrom(
                      backgroundColor: AppColors.primaryColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
