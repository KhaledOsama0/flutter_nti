import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:otlop/core/shared/colors/app_colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    required this.hint,
    this.suffixIcon,
    this.textInputType,
    this.prefixIcon,
    this.widget,
    required this.isSuffixIcon,
    this.width,
  });
  final double? width;
  final TextEditingController controller;
  final IconData? prefixIcon;
  final String hint;
  final IconData? suffixIcon;
  final TextInputType? textInputType;
  final Widget? widget;
  final bool isSuffixIcon;
  @override
  Widget build(BuildContext context) {
    return TextField(
      scrollPadding: EdgeInsets.all(20),
      dragStartBehavior: DragStartBehavior.start,
      controller: controller,
      keyboardType: textInputType,

      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.white),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.white),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.white),
        ),

        hintText: hint,
        hintStyle: TextStyle(color: Colors.grey.shade500, fontSize: 14),
        suffixIcon: isSuffixIcon
            ? Padding(
                padding: const EdgeInsets.only(right: 10),

                child: IconButton(
                  padding: EdgeInsets.zero,
                  style: IconButton.styleFrom(
                    backgroundColor: AppColors.secondaryColor,
                  ),
                  icon: Icon(suffixIcon, color: AppColors.primaryColor),
                  onPressed: () {},
                ),
              )
            : null,
        contentPadding: EdgeInsets.only(top: 20, bottom: 20),
        prefixIcon: Icon(prefixIcon),
      ),
    );
  }
}
