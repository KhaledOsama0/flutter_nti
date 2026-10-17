import 'package:flutter/material.dart';
import 'package:otlop/core/shared/shared_widgets/customTextButton.dart';
import 'package:otlop/core/shared/shared_widgets/custom_text.dart';

class RememberWidget extends StatelessWidget {
  const RememberWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: true,
          fillColor: WidgetStatePropertyAll(Colors.white),
          shape:  RoundedRectangleBorder(side: BorderSide(color: Colors.black, width: 2)),
          onChanged: (value) {},
          checkColor: Colors.black,
          visualDensity: VisualDensity(horizontal: 0, vertical: -4),
          activeColor: Colors.black,
          // side: BorderSide(color: Colors.black, width: 2),
        ),
        CustomText(
          text: 'Remember Me',
          fontSize: 12,
          color: Colors.black54,
          fontWeight: FontWeight.w500,
        ),
        Spacer(),
        CustomTextButton(text: 'Forgot Password?', onPressed: () {  },),
        
      ],
    );
  }
}
