import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:otlop/core/shared/colors/app_colors.dart';
import 'package:otlop/core/shared/shared_widgets/custom_text.dart';
import 'package:otlop/features/products/data/model/products_model.dart';
import 'package:otlop/features/products/widgets/filter_by_category_section.dart';
import 'package:otlop/features/products/widgets/filter_by_products_section.dart';
import 'package:otlop/features/products/widgets/search_section.dart';

class FilterByCategory extends StatelessWidget {
  const FilterByCategory({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _controller = TextEditingController();
    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          style: IconButton.styleFrom(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          onPressed: () {Navigator.pop(context);},
          icon: Icon(Icons.arrow_back_ios_new),
        ),
        title: CustomText(
          text: 'Latte',
          fontSize: 20,
          fontWeight: FontWeight.w800,
          color: Colors.black,
        ),
      ),
      body:Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: SingleChildScrollView(
          
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            SearchSection(controller: _controller),
            Gap(20),
            FilterByCategorySection(),
            Gap(20),
            FilterByProductsSection(product: ProductsModel.filterProductsByCategory)
          ],),
        ),
      ) ,
    );
  }
}