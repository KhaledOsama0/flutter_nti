import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:otlop/core/shared/colors/app_colors.dart';
import 'package:otlop/core/shared/shared_widgets/custom_text.dart';
import 'package:otlop/features/products/data/api/remote_products_api.dart';

import 'package:otlop/features/products/widgets/filter_by_category_section.dart';
import 'package:otlop/features/products/widgets/product_widget.dart';
import 'package:otlop/features/products/widgets/search_section.dart';

class FilterProductsScreen extends StatefulWidget {
  const FilterProductsScreen({
    super.key,
    required this.id,
    required this.categoryName,
  });
  final String categoryName;
  final int id;

  @override
  State<FilterProductsScreen> createState() => _FilterProductsScreenState();
}

class _FilterProductsScreenState extends State<FilterProductsScreen> {
  bool isLoading = true;
  List products = [];
  @override
  void initState() {
    super.initState();
    RemoteProductApi().getProductsByCategory(widget.id).then((val) {
      setState(() {
        products = val;
        isLoading = false;
      });
    });
  }
  @override
  void dispose() {
    super.dispose();
  }
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
          text: widget.categoryName,
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
              CustomText(
                text: products.length == 0
                    ? "No products found"
                    : '${products.length.toString()} items',
                color: Colors.grey.shade400,
              ),
              Gap(20),
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
                        price: products[index]['price'].toString(), id: products[index]['id'], quantity:1,
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
