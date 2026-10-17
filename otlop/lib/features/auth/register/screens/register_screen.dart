import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:otlop/core/shared/shared_widgets/custom_button.dart';
import 'package:otlop/core/shared/shared_widgets/custom_text.dart';
import 'package:otlop/features/auth/widgets/auth_form_widget.dart';
import 'package:otlop/features/auth/widgets/remember_widget.dart';
import 'package:otlop/features/home/screens/home_screen.dart';

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
                Gap(20),
                AuthFormWidget(
                  title: 'Email Address',
                  hint: 'Enter Your Email Address',
                  textInputType: TextInputType.emailAddress,
                  controller: emailController,
                ),
                Gap(20),
                AuthFormWidget(
                  title: 'Phone Number',
                  hint: 'Enter Your Phone Number',
                  controller: phoneController,
                  textInputType: TextInputType.phone,
                ),
                Gap(20),
                AuthFormWidget(
                  title: 'Password',
                  hint: 'Enter Your Password',
                  controller: passwordController,
                  suffixIcon: Icons.visibility,
                ),
                Gap(30),
                RememberWidget(),
                Gap(15),
                CustomButton(title: 'Sign Up', onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
                }),

                Gap(10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(child: Divider(thickness: 1, color: Colors.grey)),
                    CustomText(text: "  OR SIGN UP WITH  "),
                    Expanded(child: Divider()),
                  ],
                ),
                Gap(10),
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
                            CustomText(text: "GitHub",fontWeight: FontWeight.w600)
                          ],
                        ),
                      ),
                    ),
                    
                    Gap(10),Expanded(
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
                            CustomText(text: "GitLab",fontWeight: FontWeight.w600)
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
