import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:otlop/core/shared/colors/app_colors.dart';
import 'package:otlop/core/shared/shared_widgets/custom_text.dart';
import 'package:otlop/core/shared/shared_widgets/navigation.dart';
import 'package:otlop/features/cart/data/api/api_service.dart';
import 'package:otlop/features/cart/ui/screens/cart_screen.dart';

class ProductWidget extends StatelessWidget {
  ProductWidget({
    super.key,
    required this.id,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.price,
    this.onTap,
    required this.text,
    required this.quantity,
  });
  final String image, title, subtitle, price, text;
  final VoidCallback? onTap;
  final int id, quantity;
  ApiService apiService = ApiService();
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                  child: Image.network(
                    image,
                    fit: BoxFit.cover,
                    width: 170,
                    height: 167,
                  ),
                ),
                Positioned(
                  top: 10,
                  left: 10,
                  child: Container(
                    width: 100,
                    height: 40,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(221, 94, 93, 93),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Center(
                      child: CustomText(text: text, color: Colors.white),
                    ),
                  ),
                ),
              ],
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
                  onPressed: () async {
                    await apiService.addToCart(id: id, quantity: quantity).then(
                      (val) {
                        NavigateTo(context: context, screen: CartScreen());
                      },
                    );
                  },
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
    );
  }
}
