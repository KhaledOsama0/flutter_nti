import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:otlop/core/shared/colors/app_colors.dart';
import 'package:otlop/core/shared/shared_widgets/custom_button.dart';
import 'package:otlop/core/shared/shared_widgets/custom_text.dart';
import 'package:otlop/features/cart/data/api/api_service.dart';
import 'package:otlop/features/cart/ui/widgets/cart_item_widget.dart';
import 'package:otlop/features/cart/ui/widgets/order_summary_widget.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

final ApiService apiService = ApiService();

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    super.initState();
    apiService.getCart();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: AppColors.backgroundColor,
      ),
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: 'Your Cart',
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                ),
                CustomText(
                  text: '2 items · 665 EGP',
                  color: Colors.grey.shade700,
                ),
                Gap(20),
                CartItemWidget(),
                Gap(40),
                OrderSummaryWidget(),
                Gap(250),
                CustomButton(
                  onPressed: () {},
                  title: 'Proceed to Checkout · 665 EGP',
                ),
                // CheckoutButtonSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
