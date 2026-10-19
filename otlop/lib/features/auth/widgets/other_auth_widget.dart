import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:otlop/core/shared/shared_widgets/customTextButton.dart';
import 'package:otlop/core/shared/shared_widgets/custom_text.dart';

class OtherAuthWidget extends StatelessWidget {
  final String text;
  final String buttonText;
  final Widget screen;
  const OtherAuthWidget({
    super.key,
    required this.text,
    required this.buttonText,
    required this.screen,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(child: Divider(thickness: 1, color: Colors.grey)),
            CustomText(text: "  OR WITH  "),
            Expanded(child: Divider()),
          ],
        ),

        Gap(15),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 20),
                height: 50,
                decoration: BoxDecoration(
                  border: BoxBorder.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/images/github.svg',
                      width: 20,
                      height: 20,
                    ),
                    Gap(5),
                    CustomText(text: "GitHub", fontWeight: FontWeight.w600),
                  ],
                ),
              ),
            ),

            Gap(10),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 20),
                height: 50,
                decoration: BoxDecoration(
                  border: BoxBorder.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/images/gitlab.svg',
                      width: 20,
                      height: 20,
                    ),
                    Gap(5),
                    CustomText(text: "GitLab", fontWeight: FontWeight.w600),
                  ],
                ),
              ),
            ),
          ],
        ),
        Gap(20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomText(text: text, color: Colors.grey.shade600),
            Gap(10),
            CustomTextButton(
              text: buttonText,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => screen),
                );
              },
              size: 18,
            ),
          ],
        ),
      ],
    );
  }
}
