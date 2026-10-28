import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:otlop/core/shared/colors/app_colors.dart';
import 'package:otlop/core/shared/shared_widgets/custom_button.dart';
import 'package:otlop/core/shared/shared_widgets/custom_text.dart';
import 'package:otlop/core/shared/shared_widgets/navigation.dart';
import 'package:otlop/core/validation/auth_validators.dart';
import 'package:otlop/features/auth/data/api/remote_auth_api.dart';
import 'package:otlop/features/auth/register/screens/register_screen.dart';
import 'package:otlop/features/auth/widgets/auth_form_widget.dart';
import 'package:otlop/features/auth/widgets/other_auth_widget.dart';
import 'package:otlop/features/auth/widgets/remember_widget.dart';
import 'package:otlop/features/products/screens/products_screen.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    emailController.text = "KulHRqwN0V@TDmEwjp.jwy";
    passController.text = "Kh1#kH1";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: AppColors.backgroundColor,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: SingleChildScrollView(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Form(
                key: formKey,
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
                      validator: ((val) => AppValidators.validateEmail(val)),
                      title: 'Email ',
                      hint: 'Enter Your Email Address',
                      textInputType: TextInputType.emailAddress,
                      controller: emailController,
                    ),
                    Gap(10),
                    AuthFormWidget(
                      validator: ((val) => AppValidators.validatePassword(val)),

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
                      widget: isLoading?CircularProgressIndicator(color: Colors.white):null,
                      title: 'Login',
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          setState(() {
                            isLoading = true;
                          });
                          RemoteAuthApi()
                              .login(
                                email: emailController.text,
                                password: passController.text,
                              )
                              .then((value) {
                                setState(() {
                                  isLoading = false;
                                });
                                NavigateAndFinish(
                                  context: context,
                                  screen: HomeScreen(),
                                );
                              });
                        } else {
                          print('not valid');
                        }
                      },
                    ),
                    Gap(15),
                    OtherAuthWidget(
                      text: 'Don`t have an account ?',
                      buttonText: 'Sign Up',
                      screen: RegisterScreen(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
