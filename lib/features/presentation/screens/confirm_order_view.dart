import 'package:dummy_1/constants/app_colors.dart';
import 'package:dummy_1/constants/app_images.dart';
import 'package:dummy_1/features/presentation/widgets/counter.dart';
import 'package:flutter/material.dart';
import '../widgets/app_textfield.dart';
import '../widgets/main_button.dart';
import '../widgets/screen_layout.dart';

class ConfirmOrderView extends StatefulWidget {
  const ConfirmOrderView({super.key});

  @override
  State<ConfirmOrderView> createState() => _ConfirmOrderViewState();
}

class _ConfirmOrderViewState extends State<ConfirmOrderView> {
  final int _counter = 0;
  @override
  Widget build(BuildContext context) {
    return ScreenLayout(
      title: 'Confirm Order',
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 40,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Row(
              children: [
                Text(
                  'Shipping Address',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                SizedBox(width: 10),
                Icon(
                  Icons.edit,
                  color: AppColors.kF63939,
                ),
              ],
            ),
            const SizedBox(height: 20),
            AppTextFormField(
              name: 'address',
              validate: (value) {
                return null;
              },
              showBorderRadius: true,
              borderRadius: 20,
              fillColor: AppColors.kDCDCDC,
            ),
            const SizedBox(height: 30),
            const Text(
              'Order Summary',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 25),
            Column(
              children: [
                const Divider(
                  color: AppColors.kFFDECF,
                  height: 0,
                ),
                ListView.separated(
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  itemBuilder: (context, index) => ListTile(
                    visualDensity: VisualDensity.compact,
                    dense: true,
                    contentPadding: const EdgeInsets.symmetric(vertical: 20),
                    leading: Image.asset(AppAssets.googleIcon),
                    title: const Text(
                      'Berry Shake',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    subtitle: const Text(
                      '\$20.00',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: AppColors.kF63939,
                      ),
                    ),
                    trailing: SizedBox(
                      width: 100,
                      child: CounterWidget(
                        initialCounter: _counter,
                      ),
                    ),
                  ),
                  separatorBuilder: (context, index) => const Divider(
                    color: AppColors.kFFDECF,
                    height: 0,
                  ),
                  itemCount: 2,
                ),
                const Divider(
                  color: AppColors.kFFDECF,
                  height: 0,
                ),
                const SizedBox(height: 25),
                buildTextRow(
                  leadingText: 'Subtotal',
                  trailingText: '\$20.00',
                ),
                const SizedBox(height: 10),
                buildTextRow(
                  leadingText: 'Delivery',
                  trailingText: 'FREE',
                ),
                const SizedBox(height: 10),
                buildTextRow(
                  leadingText: 'Payment Method',
                  trailingText: 'COD',
                ),
                const SizedBox(height: 10),
                const Divider(
                  color: AppColors.kFFDECF,
                  height: 0,
                ),
                const SizedBox(height: 25),
                buildTextRow(
                  leadingText: 'Total',
                  trailingText: '\$20.00',
                ),
                const SizedBox(height: 40),
                MainButton(
                  buttonColor: AppColors.kFFDECF,
                  fontColor: AppColors.kF63939,
                  isIconAtStart: true,
                  onPressed: () {},
                  text: 'Place Order',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Row buildTextRow({
    required String leadingText,
    required String trailingText,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          leadingText,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        Text(
          trailingText,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}
