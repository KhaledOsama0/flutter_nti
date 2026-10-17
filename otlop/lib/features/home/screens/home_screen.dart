import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:otlop/core/shared/colors/app_colors.dart';
import 'package:otlop/core/shared/shared_widgets/custom_text.dart';
import 'package:otlop/core/shared/shared_widgets/custom_text_feild.dart';
import 'package:otlop/features/home/data/model/brand_model.dart';
import 'package:otlop/features/home/data/model/category_model.dart';
import 'package:otlop/features/home/data/model/products_model.dart';
import 'package:otlop/features/home/widgets/brand_widget.dart';
import 'package:otlop/features/home/widgets/category_widget.dart';
import 'package:otlop/features/home/widgets/header_home_widget.dart';
import 'package:otlop/features/home/widgets/product_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(toolbarHeight: 0),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeaderHomeWidget(),
                Gap(15),
                Container(
                  width: 213,
                  height: 32,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: AppColors.secondaryColor,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.location_on, color: AppColors.primaryColor),
                      CustomText(
                        text: '14 Tahrir Square, Cairo',
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                      Icon(
                        Icons.arrow_drop_down_sharp,
                        color: AppColors.primaryColor,
                      ),
                      Gap(15),
                    ],
                  ),
                ),
                Gap(20),
                CustomTextField(
                  suffixIcon: Icons.filter_list_alt,
                  prefixIcon: Icons.search,
                  controller: searchController,
                  hint: 'Search coffee, cakes, donuts...',
                ),
                Gap(20),
                Row(
                  children: [
                    CustomText(
                      text: 'Categories',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    Spacer(),
                    CustomText(
                      text: 'See all',
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.primaryColor,
                    ),
                  ],
                ),
                Gap(15),
                SizedBox(
                  height: 110,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: CategoryModel.categories.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: CategoryWidget(
                        image: CategoryModel.categories[index].image,
                        title: CategoryModel.categories[index].title,
                      ),
                    ),
                  ),
                ),
                Gap(15),
                CustomText(
                  text: 'Brands',
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
                Gap(15),
                SizedBox(
                  height: 50,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: BrandModel.brands.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: BrandWidget(text: BrandModel.brands[index].text),
                    ),
                  ),
                ),
                Gap(15),
                CustomText(
                  text: 'Popular right now',
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
                Gap(15),

                SizedBox(
                  height: 971,
                  child: GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      
                      
                      childAspectRatio: .55,
                      crossAxisCount: 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                    ),
                    itemCount: ProductsModel.products.length,
                    itemBuilder: (context, index) => ProductWidget(
                      image: ProductsModel.products[index].image,
                      title: ProductsModel.products[index].title,
                      subtitle: ProductsModel.products[index].subtitle,
                      price: ProductsModel.products[index].price,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
