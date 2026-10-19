import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:otlop/core/shared/colors/app_colors.dart';
import 'package:otlop/core/shared/shared_widgets/custom_text.dart';
import 'package:otlop/core/shared/shared_widgets/navigation.dart';
import 'package:otlop/features/products/data/model/products_model.dart';
import 'package:otlop/features/products/screens/filter_by_category.dart';
import 'package:otlop/features/products/widgets/filter_by_category_section.dart';
import 'package:otlop/features/products/widgets/product_widget.dart';
import 'package:otlop/features/products/widgets/search_section.dart';

class FilterProductsScreen extends StatelessWidget {
  const FilterProductsScreen({super.key});

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
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new),
        ),
        title: CustomText(
          text: 'Costa',
          fontSize: 20,
          fontWeight: FontWeight.w800,
          color: Colors.black,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(20),
              SearchSection(controller: _controller),
              Gap(20),
              FilterByCategorySection(),
              Gap(30),
              CustomText(text: '4 items', color: Colors.grey.shade400),
              Gap(20),
              GestureDetector(
                onTap: () {
                  NavigateTo(context: context, screen: FilterByCategory());
                },
                child: SizedBox(
                  height: 650,
                  child: GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: 0.66,
                    ),
                    itemCount: ProductsModel.filterProducts.length,
                    itemBuilder: (context, index) => ProductWidget(
                      image: ProductsModel.filterProducts[index].image,
                      title: ProductsModel.filterProducts[index].title,
                      subtitle: ProductsModel.filterProducts[index].subtitle,
                      price: ProductsModel.filterProducts[index].price,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
