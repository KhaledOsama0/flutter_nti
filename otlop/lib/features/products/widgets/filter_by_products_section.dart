import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:otlop/core/shared/shared_widgets/custom_text.dart';
import 'package:otlop/features/products/data/model/products_model.dart';
import 'package:otlop/features/products/widgets/product_widget.dart';

class FilterByProductsSection extends StatelessWidget {
    
    final double? height;
    final List <ProductsModel> product;
  const FilterByProductsSection({super.key, this.height, required this.product});

  @override
  Widget build(BuildContext context,) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(text: '${product.length} items', color: Colors.grey.shade400),
        Gap(20),
        SizedBox(
          height:height?? 650,
          child: GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 0.66,
            ),
            itemCount: product.length,
            itemBuilder: (context, index) => ProductWidget(
              image: product[index].image,
              title: product[index].title,
              subtitle: product[index].subtitle,
              price: product[index].price,
            ),
          ),
        ),
      ],
    );
  }
}
