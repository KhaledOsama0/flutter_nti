import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:otlop/core/shared/colors/app_colors.dart';
import 'package:otlop/core/shared/shared_widgets/custom_button.dart';
import 'package:otlop/core/shared/shared_widgets/custom_text.dart';
import 'package:otlop/features/auth/register/screens/register_screen.dart';
import 'package:otlop/features/auth/widgets/auth_form_widget.dart';
import 'package:otlop/features/auth/widgets/other_auth_widget.dart';
import 'package:otlop/features/auth/widgets/remember_widget.dart';
import 'package:otlop/features/products/screens/products_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: AppColors.backgroundColor,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: "Hi, Wecome Back! 👋",
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
              CustomText(
                text: "Hello again, you’ve been missed!",
                fontWeight: FontWeight.normal,
                fontSize: 16,
                color: Colors.grey.shade600,
              ),
              Gap(20),
              AuthFormWidget(
                title: 'Email ',
                hint: 'Enter Your Email Address',
                textInputType: TextInputType.emailAddress,
                controller: emailController,
              ),
              Gap(10),
              AuthFormWidget(
                title: 'Password',
                hint: 'Enter Password',
                textInputType: TextInputType.visiblePassword,
                controller: passController,
                suffixIcon: Icons.visibility,
              ),
              Gap(10),
              RememberWidget(),
              Gap(15),
              CustomButton(
                title: 'Login',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                },
              ),
              Gap(15),
              OtherAuthWidget(text: 'Don`t have an account ?', buttonText: 'Sign Up', screen: RegisterScreen(),),
            ],
          ),
        ),
      ),
    );
  }
}
