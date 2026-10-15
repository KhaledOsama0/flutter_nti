import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ChatItemWidget extends StatelessWidget {
  final String image, text, subText;
  const ChatItemWidget({
    super.key,
    required this.image,
    required this.text,
    required this.subText,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundImage: AssetImage(image),
        ),
        Gap(8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              text,
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
            ),
            Text(
              subText,
              style: TextStyle(fontWeight: FontWeight.normal, fontSize: 13),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ],
    );
  }
}
