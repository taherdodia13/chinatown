import 'package:dummy_1/constants/app_colors.dart';
import 'package:dummy_1/features/presentation/widgets/app_textfield.dart';
import 'package:dummy_1/features/presentation/widgets/main_button.dart';
import 'package:flutter/material.dart';

import '../../../constants/app_images.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kf2f2f2,
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: AppColors.kFFFFFF,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    children: [
                      const Spacer(),
                      Image.asset(AppAssets.loginImage),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  // Added SingleChildScrollView here
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 70, horizontal: 50),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const AppTextFormField(
                          name: 'email',
                          hintText: 'Email',
                          fillColor: Colors.transparent,
                          hasBorder: true,
                          contentPadding: EdgeInsets.symmetric(vertical: 10),
                        ),
                        const SizedBox(height: 40),
                        const AppTextFormField(
                          name: 'password',
                          hintText: 'Password',
                          hasBorder: true,
                          fillColor: Colors.transparent,
                          contentPadding: EdgeInsets.symmetric(vertical: 10),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'Forgot password?',
                          style: TextStyle(color: AppColors.kFA4A0C),
                        ),
                        // const SizedBox(height: 5),
                        MainButton(
                          onPressed: () {},
                          text: 'Login',
                        ),
                        MainButton.icon(
                          buttonColor: AppColors.kFFFFFF,
                          fontColor: AppColors.k000000,
                          borderSide:
                              const BorderSide(color: AppColors.kc4c4c4),
                          icon: SizedBox(
                            height: 20,
                            child: Image(
                              image: AssetImage(
                                AppAssets.googleIcon,
                              ),
                            ),
                          ),
                          horizontalSpace: 5,
                          onPressed: () {},
                          isIconAtStart: true,
                          text: 'Continue with Google',
                          fontSize: 16,
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
