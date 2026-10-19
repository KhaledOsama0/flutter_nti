import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:otlop/core/shared/shared_widgets/custom_button.dart';
import 'package:otlop/core/shared/shared_widgets/custom_text.dart';
import 'package:otlop/features/auth/login/screens/login_screen.dart';
import 'package:otlop/features/auth/widgets/auth_form_widget.dart';
import 'package:otlop/features/auth/widgets/other_auth_widget.dart';
import 'package:otlop/features/auth/widgets/remember_widget.dart';
import 'package:otlop/features/products/screens/products_screen.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Form(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
              
                children: [
                  CustomText(
                    text: "Create an account",
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                  CustomText(
                    text: "Connect with your friends today!",
                    fontWeight: FontWeight.normal,
                    fontSize: 16,
                    color: Colors.grey.shade600,
                  ),
                  Gap(30),
                  AuthFormWidget(
                    title: 'Name',
                    hint: 'Enter Your Name',
                    controller: nameController,
                    textInputType: TextInputType.name,
                  ),
                  Gap(15),
                  AuthFormWidget(
                    title: 'Email Address',
                    hint: 'Enter Your Email Address',
                    textInputType: TextInputType.emailAddress,
                    controller: emailController,
                  ),
                  Gap(15),
                  AuthFormWidget(
                    title: 'Phone Number',
                    hint: 'Enter Your Phone Number',
                    controller: phoneController,
                    textInputType: TextInputType.phone,
                  ),
                  Gap(15),
                  AuthFormWidget(
                    title: 'Password',
                    hint: 'Enter Your Password',
                    controller: passwordController,
                    suffixIcon: Icons.visibility,
                  ),
                  Gap(10),
                  RememberWidget(),
                  Gap(10),
                  CustomButton(
                    title: 'Sign Up',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      );
                    },
                  ),
              
                  Gap(15),
              OtherAuthWidget(text: 'Already have an account ?', buttonText: 'Login', screen: LoginScreen(),),
                  
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
