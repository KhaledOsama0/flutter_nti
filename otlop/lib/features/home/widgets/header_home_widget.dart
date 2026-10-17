import 'package:flutter/material.dart';
import 'package:otlop/core/shared/shared_widgets/custom_text.dart';

class HeaderHomeWidget extends StatelessWidget {
  const HeaderHomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: "Good evening 🥐",
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Colors.grey.shade600,
            ),
            CustomText(
              text: "Alex",
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ],
        ),
        Spacer(),
        IconButton.filled(
          color: Colors.black,
          style: IconButton.styleFrom(backgroundColor: Colors.white),
          onPressed: () {},
          icon: Icon(Icons.notifications_outlined),
        ),
      ],
    );
    
  }
}
