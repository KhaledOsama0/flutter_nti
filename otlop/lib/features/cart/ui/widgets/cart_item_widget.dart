import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:otlop/core/shared/colors/app_colors.dart';
import 'package:otlop/core/shared/shared_widgets/custom_text.dart';

class CartItemWidget extends StatelessWidget {
  const CartItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      width: double.infinity,
      height: 120,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(1, 3),
          ),
        ],
      ),

      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
        child: Row(
          children: [
            Image.asset('assets/images/coffee.png', fit: BoxFit.scaleDown),
            Gap(10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: 'Double Frappuccino',
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
                CustomText(
                  text: 'Starbucks Frappuccino',
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey.shade500,
                ),
                Gap(10),
                Spacer(),
                Row(
                  children: [
                    CustomText(
                      text: '400 EGP',
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                      color: AppColors.primaryColor,
                    ),
                    Gap(20),
                    Container(
                      width: 120,
                      height: 36,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.grey.shade50,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {},
                            icon: Icon(
                              Icons.remove,
                              size: 22,
                              color: const Color.fromRGBO(97, 97, 97, 1),
                            ),
                            style: IconButton.styleFrom(
                              backgroundColor: Colors.grey.shade200,
                              shape: CircleBorder(),
                            ),
                          ),
                          CustomText(
                            text: '1',
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                          IconButton(
                            padding: EdgeInsets.zero,

                            onPressed: () {},
                            icon: Center(
                              child: Icon(
                                Icons.add,
                                size: 22,
                                color: Colors.white,
                              ),
                            ),
                            style: IconButton.styleFrom(
                              backgroundColor: AppColors.primaryColor,
                              shape: CircleBorder(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
