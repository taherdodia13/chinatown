import 'package:dummy_1/constants/app_colors.dart';
import 'package:dummy_1/constants/app_images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../widgets/counter.dart';
import '../widgets/main_button.dart';
import '../widgets/screen_layout.dart';

class ProductDetailView extends StatefulWidget {
  const ProductDetailView({super.key});

  @override
  State<ProductDetailView> createState() => _ProductDetailViewState();
}

class _ProductDetailViewState extends State<ProductDetailView> {
  final int _counter = 0;
  String? _selectedOption = 'Half';

  @override
  Widget build(BuildContext context) {
    return ScreenLayout(
      title: 'nested tab names',
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 50,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(30),
              ),
              child: Image.asset(
                AppAssets.banner,
                height: 220,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Flexible(
                  child: Text(
                    'Tortilla Chips With Toppins',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                CounterWidget(
                  initialCounter: _counter,
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Divider(
              color: AppColors.kFFDECF,
              height: 0,
            ),
            const SizedBox(height: 10),
            const Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, '
              'sed do eiusmod tempor incididunt ut labore.',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 40),
            buildOptionRadioListTile(
              title: 'Half',
              price: '\$30.00',
              value: 'Half',
              groupValue: _selectedOption,
              onChanged: (value) {
                setState(() {
                  _selectedOption = value;
                });
              },
            ),
            buildOptionRadioListTile(
              title: 'Full',
              price: '\$50.00',
              value: 'Full',
              groupValue: _selectedOption,
              onChanged: (value) {
                setState(() {
                  _selectedOption = value;
                });
              },
            ),
            const SizedBox(height: 40),
            MainButton.icon(
              icon: const Icon(
                Icons.shopping_cart,
                color: AppColors.kFFFFFF,
              ),
              isIconAtStart: true,
              onPressed: () {},
              text: 'Add to Cart',
            )
          ],
        ),
      ),
    );
  }

  Widget buildOptionRadioListTile({
    required String title,
    required String price,
    required String value,
    required String? groupValue,
    required ValueChanged<String?> onChanged,
  }) =>
      Row(
        children: [
          SizedBox(
            width: 200,
            child: RadioListTile<String>(
              title: Container(
                width: 50,
                padding: const EdgeInsets.symmetric(
                  vertical: 4,
                  horizontal: 10,
                ),
                decoration: BoxDecoration(
                  color: AppColors.kFFDECF,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: AppColors.kF63939,
                  ),
                ),
              ),
              activeColor: AppColors.kF63939,
              value: value,
              groupValue: groupValue,
              onChanged: onChanged,
            ),
          ),
          Text(
            price,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ],
      );
}
