import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:otlop/core/shared/shared_widgets/custom_text.dart';
import 'package:otlop/features/products/data/api/remote_api.dart';
import 'package:otlop/features/products/data/model/products_model.dart';
import 'package:otlop/features/products/widgets/product_widget.dart';

class FilterByProductsSection extends StatefulWidget {
    
    final double? height;
    final int id;
  const FilterByProductsSection({super.key, this.height,  required this.id, required List<ProductsModel> product});

  @override
  State<FilterByProductsSection> createState() => _FilterByProductsSectionState();
}

class _FilterByProductsSectionState extends State<FilterByProductsSection> {
  List  products = [];
  bool isLoading = true;
  @override
  void initState() {
    
    super.initState();
    RemoteProductApi().getProductsByCategory(widget.id).then((val){
      setState(() {
        products = val;
        isLoading = false;
      });
    });
    }
  @override
  Widget build(BuildContext context,) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(text: '${products.length} items', color: Colors.grey.shade400),
        Gap(20),
        SizedBox(
          height:widget.height?? 650,
          child: GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 0.66,
            ),
            itemCount: products.length,
            itemBuilder: (context, index) => ProductWidget(
              text: products[index]['category'],
              image: products[index].image,
              title: products[index].title,
              subtitle: products[index].subtitle,
              price: products[index].price,
            ),
          ),
        ),
      ],
    );
  }
}
