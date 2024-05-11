import 'package:dummy_1/constants/app_colors.dart';
import 'package:dummy_1/constants/app_images.dart';
import 'package:flutter/material.dart';

import '../widgets/app_textfield.dart';
import '../widgets/main_button.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kF63939,
      body: Column(
        children: [
          const Expanded(
            flex: 1,
            child: Center(
              child: Text(
                'My Profile',
                style: TextStyle(
                  color: AppColors.kFFFFFF,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: AppColors.kF2F2F2,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 50,
                ),
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.rectangle,
                        image: DecorationImage(
                          image: AssetImage(AppAssets.googleIcon),
                          fit: BoxFit.cover,
                        ),
                        border: Border.all(
                          color: Colors.white,
                          width: 4,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    const SizedBox(height: 20),
                    buildTextField(
                      name: 'fName',
                      label: 'Full name',
                      validate: (value) {
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    buildTextField(
                      name: 'address',
                      label: 'Delivery Address',
                      validate: (value) {
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    buildTextField(
                      name: 'phone',
                      label: 'Phone Number',
                      preFixIcon: const Center(
                        child: Text('+91'),
                      ),
                      keyboardType: TextInputType.number,
                      validate: (value) {
                        return null;
                      },
                    ),
                    const SizedBox(height: 30),
                    MainButton(
                      onPressed: () {},
                      text: 'Take Me to Home',
                      minimumSize: const Size(180, 50),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTextField({
    required String name,
    required String label,
    Widget? preFixIcon,
    String? Function(dynamic)? validate,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(label),
        const SizedBox(height: 10),
        AppTextFormField(
          name: name,
          preFixIcon: preFixIcon,
          contentPadding: const EdgeInsets.symmetric(vertical: 20),
          validate: validate,
          keyboardType: keyboardType,
        ),
      ],
    );
  }
}
