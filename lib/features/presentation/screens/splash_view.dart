import 'package:flutter/material.dart';
import '../../../constants/app_images.dart';
import '../widgets/main_button.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(50),
        child: Column(
          children: <Widget>[
            const Spacer(),
            Image.asset(
              AppAssets.splash,
              height: 200,
            ),
            const Spacer(),
            MainButton(
              onPressed: () {},
              text: 'Get started',
            )
          ],
        ),
      ),
    );
  }
}
