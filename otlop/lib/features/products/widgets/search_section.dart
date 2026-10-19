import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:otlop/core/shared/shared_widgets/custom_text_feild.dart';

class SearchSection extends StatelessWidget {
  const SearchSection({super.key, required this.controller});
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 300,
          height: 60,
          child: CustomTextField(
            controller: controller,
            hint: 'Search products...',
            prefixIcon: Icons.search_outlined,
            widget: Container(),
            isSuffixIcon: false,
          ),
        ),
        Gap(7),
        IconButton(
          iconSize: 40,
          style: IconButton.styleFrom(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          onPressed: () {},
          icon: Icon(Icons.filter_list),
        ),
      ],
    );
  }
}
