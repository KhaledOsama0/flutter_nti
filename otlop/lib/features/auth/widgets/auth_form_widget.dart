import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AuthFormWidget extends StatelessWidget {
  const AuthFormWidget({
    super.key,
    required this.title,
    required this.hint,
    this.suffixIcon, required this.controller, this.textInputType,
  });
  final TextEditingController controller ;
  final String title;
  final String hint;
  final IconData? suffixIcon;
  final TextInputType ?textInputType;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Gap(5),
        Container(
          width: double.infinity,
          height: 60,
          child: TextFormField(
            controller: controller,
            keyboardType: textInputType ?? TextInputType.text,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.grey.shade500),
              ),
              hintText: hint,
              hintStyle: TextStyle(color: Colors.grey.shade500),
              suffixIcon: suffixIcon != null ? Icon(suffixIcon) : null,
            ),
          ),
        ),
      ],
    );
  }
}
