import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:otlop/core/shared/colors/app_colors.dart';
import 'package:otlop/core/shared/shared_widgets/custom_text.dart';

import 'package:otlop/features/products/widgets/product_tag_widget.dart';

class ProductsDetails extends StatelessWidget {
  const ProductsDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                child: Image.asset('assets/images/Glazed Donuts.png'),
              ),
              Gap(20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        ProductTagWidget(
                          text: 'Cilantro',
                          backgroundColor: AppColors.secondaryColor,
                          textColor: AppColors.primaryColor,
                        ),
                        Gap(20),
                        ProductTagWidget(
                          text: 'Donuts',
                          backgroundColor: Color(0xffF3F4F6),
                          textColor: Color(0xff6B7280),
                        ),
                      ],
                    ),
                    Gap(10),

                    CustomText(
                      text: 'Glazed Donuts',
                      fontSize: 30,
                      fontWeight: FontWeight.w800,
                    ),
                    Gap(10),
                    Row(
                      textBaseline: TextBaseline.alphabetic,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      children: [
                        CustomText(
                          text: '180',
                          fontSize: 42,
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.w800,
                        ),
                        CustomText(
                          text: ' EGP',
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Colors.grey.shade400,
                        ),
                      ],
                    ),
                    CustomText(
                      text: 'ABOUT THIS ITEM',
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: Colors.grey.shade600,
                      letterSpacing: 1.5,
                    ),
                    Gap(7),
                    CustomText(
                      text: '''Classic ring donuts hand-dipped in a signature
sugar glaze while still warm from the fryer.
Light, pillowy and irresistibly sweet.''',
                      fontSize: 15,
                      color: Colors.grey.shade700,
                      maxLines: 3,
                    ),
                    Gap(10),
                  ],
                ),
              ),
              Container(
                width: 390,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,

                  children: [
                    Container(
                      width: 118,
                      height: 56,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Row(
                        children: [
                          IconButton(
                            style: IconButton.styleFrom(
                              backgroundColor: Colors.grey.shade200,
                            ),
                            onPressed: () {Navigator.pop(context);},
                            icon: Icon(
                              Icons.remove,
                              color: Colors.grey.shade500,
                            ),
                          ),
                          CustomText(
                            text: '1',
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                          IconButton(
                            style: IconButton.styleFrom(
                              backgroundColor: AppColors.primaryColor,
                            ),
                            onPressed: () {},
                            icon: Icon(Icons.add, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: 212,
                        height: 60,
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Center(
                          child: CustomText(
                            text: 'Add to cart · 180 EGP',
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
