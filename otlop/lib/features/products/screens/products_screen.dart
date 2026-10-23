import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:otlop/core/shared/colors/app_colors.dart';
import 'package:otlop/core/shared/shared_widgets/custom_text.dart';
import 'package:otlop/core/shared/shared_widgets/custom_text_feild.dart';
import 'package:otlop/core/shared/shared_widgets/navigation.dart';
import 'package:otlop/features/products/data/api/remote_api.dart';
import 'package:otlop/features/products/screens/filter_by_category.dart';
import 'package:otlop/features/products/screens/filter_products_screen.dart';
import 'package:otlop/features/products/screens/products_details.dart';
import 'package:otlop/features/products/widgets/brand_widget.dart';
import 'package:otlop/features/products/widgets/category_widget.dart';
import 'package:otlop/features/products/widgets/header_home_widget.dart';
import 'package:otlop/features/products/widgets/product_widget.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading = true;
  List products = [];
  List categories = [];
  List brands = [];

  @override
  void initState() {
    super.initState();
    RemoteProductApi().getProducts().then(
      (value) {
        setState(() {
          isLoading = false;
          products = value;
        });
      },
      onError: (error) {
        isLoading = false;
        log(error.toString());
      },
    );
    RemoteProductApi().getCategories().then(
      (value) {
        setState(() {
          isLoading = false;
          categories = value;
        });
      },
      onError: (error) {
        isLoading = false;
        log(error.toString());
      },
    );
    RemoteProductApi().getBrands().then(
      (value) {
        setState(() {
          isLoading = false;
          brands = value;
        });
      },
      onError: (error) {
        isLoading = false;
        log(error.toString());
      },
    );
  }

  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        toolbarHeight: 0,
        backgroundColor: AppColors.backgroundColor,
      ),
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
                  width: 235,
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
                  isSuffixIcon: true,
                ),
                Gap(20),
                Container(
                  width: 365,
                  height: 176,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: AppColors.primaryColor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Gap(10),
                        Container(
                          width: 107,
                          height: 25,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Color.fromARGB(
                              255,
                              255,
                              255,
                              255,
                            ).withOpacity(.2),
                          ),
                          child: Center(
                            child: CustomText(
                              text: 'Limited offer',
                              color: Colors.white,
                            ),
                          ),
                        ),
                        CustomText(
                          text: '''Free delivery on
your first order''',
                          maxLines: 2,
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                        Gap(20),
                        CustomText(
                          text: 'Use code BITE10 at checkout',
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ],
                    ),
                  ),
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
                  child: isLoading
                      ? Center(
                          child: CircularProgressIndicator(
                            color: AppColors.primaryColor,
                          ),
                        )
                      : ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: categories.length,
                          itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.only(right: 16),
                            child: GestureDetector(
                              onTap: () {
                                NavigateTo(
                                  context: context,
                                  screen: FilterProductsScreen(
                                    id:categories[index]['id'],
                                    categoryName: categories[index]['name'],
                                  ),
                                );
                              },
                              child: CategoryWidget(
                                image: categories[index]['pictureUrl'],
                                title: categories[index]['name'],
                              ),
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
                  child: isLoading
                      ? Center(
                          child: CircularProgressIndicator(
                            color: AppColors.primaryColor,
                          ),
                        )
                      : ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: brands.length,
                          itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.only(right: 16.0),
                            child: InkWell(
                              onTap: () => NavigateTo(
                                context: context,
                                screen: FilterByCategory(
                                  id: brands[index]['id'],
                                  name: brands[index]['name'],
                                ),
                              ),
                              child: BrandWidget(text: brands[index]['name']),
                            ),
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

                isLoading
                    ? Center(
                        child: CircularProgressIndicator(
                          color: AppColors.primaryColor,
                        ),
                      )
                    : GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: .55,
                          crossAxisCount: 2,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                        ),
                        itemCount: products.length,
                        itemBuilder: (context, index) => ProductWidget(
                          text: products[index]['category'],
                          image: products[index]['pictureUrl'],
                          title: products[index]['name'],
                          subtitle: products[index]['description'],
                          price: products[index]['price'].toString(),
                          onTap: () => NavigateTo(
                            context: context,
                            screen: ProductsDetails(),
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
