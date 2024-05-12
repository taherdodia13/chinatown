import 'package:dummy_1/constants/app_colors.dart';
import 'package:dummy_1/features/presentation/widgets/screen_layout.dart';
import 'package:flutter/material.dart';
import '../../../constants/app_images.dart';
import '../widgets/main_button.dart';

class OrderConfirmView extends StatefulWidget {
  const OrderConfirmView({super.key});

  @override
  State<OrderConfirmView> createState() => _OrderConfirmViewState();
}

class _OrderConfirmViewState extends State<OrderConfirmView> {
  @override
  Widget build(BuildContext context) {
    return ScreenLayout(
      showBackIcon: false,
      title: '¡Order Confirmed!',
      child: Padding(
        padding: const EdgeInsets.all(50),
        child: Column(
          children: <Widget>[
            Image.asset(
              AppAssets.orderConfirm,
              height: 200,
            ),
            const Spacer(),
            const Text(
              'Your order has been placed succesfully',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Spacer(),
            const Text(
              'Order will arrive within 30 mins, Thank you for your patience.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: AppColors.kF63939,
              ),
            ),
            const Spacer(),
            MainButton(
              onPressed: () {},
              text: 'Go Home',
            )
          ],
        ),
      ),
    );
  }
}
