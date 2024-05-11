import 'package:dummy_1/features/presentation/screens/navigation_view.dart';
import 'package:dummy_1/features/presentation/widgets/app_textfield.dart';
import 'package:dummy_1/features/presentation/screens/profile_view.dart';
import 'package:dummy_1/features/presentation/widgets/main_button.dart';
import 'package:dummy_1/constants/app_colors.dart';
import '../../../constants/app_images.dart';
import 'package:flutter/material.dart';

import 'order_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kf2f2f2,
      body: DefaultTabController(
        initialIndex: 0,
        length: 2,
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height / 2.3,
                  decoration: const BoxDecoration(
                    color: AppColors.kFFFFFF,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                  ),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TabBar(
                        labelPadding: EdgeInsets.symmetric(vertical: 10),
                        indicatorColor: AppColors.kF63939,
                        unselectedLabelColor: AppColors.k000000,
                        labelColor: AppColors.kF63939,
                        indicatorSize: TabBarIndicatorSize.label,
                        tabs: <Widget>[
                          Text(
                            'Login',
                            style: TextStyle(fontSize: 18),
                          ),
                          Text(
                            'Sign-up',
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Positioned(
                  left: 20,
                  top: 40,
                  child: Image.asset(AppAssets.loginImage),
                )
              ],
            ),
            Expanded(
              child: TabBarView(
                children: <Widget>[
                  SingleChildScrollView(
                    padding: const EdgeInsets.all(50),
                    physics: const BouncingScrollPhysics(),
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
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const OrderView(),
                              ),
                            );
                          },
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
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const ProfileView(),
                              ),
                            );
                          },
                          isIconAtStart: true,
                          text: 'Continue with Google',
                          fontSize: 16,
                        ),
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    padding: const EdgeInsets.all(50),
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        const AppTextFormField(
                          name: 'email',
                          hintText: 'Email',
                          preFixIcon: Icon(Icons.mail),
                          contentPadding: EdgeInsets.symmetric(vertical: 20),
                          showBorderRadius: true,
                          borderRadius: 15,
                        ),
                        const SizedBox(height: 12),
                        const AppTextFormField(
                          name: 'password',
                          hintText: 'Password',
                          preFixIcon: Icon(Icons.lock_outline),
                          suffixIcon: Icon(Icons.remove_red_eye_outlined),
                          showBorderRadius: true,
                          borderRadius: 15,
                          contentPadding: EdgeInsets.symmetric(vertical: 20),
                        ),
                        const SizedBox(height: 100),
                        MainButton(
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => const NavigationView(),
                              ),
                            );
                          },
                          text: 'Create Account',
                          minimumSize: const Size(180, 50),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
