import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:otlop/core/shared/colors/app_colors.dart';
import 'package:otlop/core/shared/shared_widgets/custom_text.dart';
import 'package:otlop/core/shared/shared_widgets/navigation.dart';
import 'package:otlop/features/products/data/api/remote_products_api.dart';
import 'package:otlop/features/products/screens/products_details.dart';
import 'package:otlop/features/products/widgets/filter_by_category_section.dart';
import 'package:otlop/features/products/widgets/product_widget.dart';
import 'package:otlop/features/products/widgets/search_section.dart';

class FilterByCategory extends StatefulWidget {
  const FilterByCategory({super.key, required this.id, required this.name});
  final int id;
  final String name;
  @override
  State<FilterByCategory> createState() => _FilterByCategoryState();
}

class _FilterByCategoryState extends State<FilterByCategory> {
  List brands = [];
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    RemoteProductApi()
        .getProductsByBrand(widget.id)
        .then(
          (val) {
            brands = val;
            isLoading = false;
            setState(() {});
          },
          onError: (error) {
            isLoading = false;
            log(error.toString());
          },
        );
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
          text: widget.name,
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
              SearchSection(controller: _controller),
              Gap(20),
              FilterByCategorySection(),
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
                      itemCount: brands.length,
                      itemBuilder: (context, index) => ProductWidget(
                        text: brands[index]['brand'],
                        image: brands[index]['pictureUrl'],
                        title: brands[index]['name'],
                        subtitle: brands[index]['description'],
                        price: brands[index]['price'].toString(),
                        onTap: () => NavigateTo(
                          context: context,
                          screen: ProductsDetails(),
                        ), id: brands[index]['id'], quantity: 1
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
