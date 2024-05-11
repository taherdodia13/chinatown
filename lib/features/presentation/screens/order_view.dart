import 'package:dummy_1/constants/app_images.dart';
import 'package:dummy_1/features/presentation/widgets/screen_layout.dart';
import 'package:flutter/material.dart';
import '../../../constants/app_colors.dart';

class OrderView extends StatefulWidget {
  const OrderView({super.key});

  @override
  State<OrderView> createState() => _OrderViewState();
}

class _OrderViewState extends State<OrderView> with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
    tabController.animation!.addListener(() {
      if (tabController.animation!.value.round() != tabController.index) {
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    tabController.animation!.removeListener(() {});
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenLayout(
      title: 'My Orders',
      child: Column(
        children: <Widget>[
          TabBar(
            controller: tabController,
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            dividerColor: Colors.transparent,
            unselectedLabelColor: AppColors.k000000,
            labelColor: AppColors.kF63939,
            indicator: const BoxDecoration(
              color: Colors.transparent,
            ),
            onTap: (index) {
              tabController.index = index;
              setState(() {});
            },
            tabs: <Widget>[
              buildTabContainer(
                title: 'Orders',
                fontColor: tabController.index == 0
                    ? AppColors.kFFFFFF
                    : AppColors.kF63939,
                backgroundColor: tabController.index == 0
                    ? AppColors.kF63939
                    : AppColors.kFFDECF,
              ),
              buildTabContainer(
                title: 'History',
                fontColor: tabController.index == 1
                    ? AppColors.kFFFFFF
                    : AppColors.kF63939,
                backgroundColor: tabController.index == 1
                    ? AppColors.kF63939
                    : AppColors.kFFDECF,
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: Divider(
              color: AppColors.kF63939,
              height: 0,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
              child: TabBarView(
                controller: tabController,
                children: <Widget>[
                  buildOrderList(),
                  buildHistoryList(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  ListView buildOrderList() {
    return ListView.separated(
      itemBuilder: (context, index) => ListTile(
        visualDensity: VisualDensity.compact,
        contentPadding: const EdgeInsets.symmetric(vertical: 10),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset(
            AppAssets.googleIcon,
            height: 40,
            width: 40,
            fit: BoxFit.contain,
          ),
        ),
        title: const Text(
          'Short Receipt will shownup here ',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      separatorBuilder: (context, index) => const Divider(
        color: AppColors.kF63939,
        height: 0,
      ),
      itemCount: 20,
    );
  }

  ListView buildHistoryList() {
    return ListView.separated(
      itemBuilder: (context, index) => ListTile(
        visualDensity: VisualDensity.compact,
        contentPadding: const EdgeInsets.symmetric(vertical: 10),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset(
            AppAssets.googleIcon,
            height: 40,
            width: 40,
            fit: BoxFit.contain,
          ),
        ),
        title: const Text(
          'Strawberry Shake',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        subtitle: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('29 Nov, 01:20 pm'),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.check_circle_outline,
                  color: AppColors.kF63939,
                ),
                SizedBox(width: 5),
                Text('Delivered'),
              ],
            ),
          ],
        ),
        trailing: const Column(
          children: [
            Text(
              '\$20.00',
              style: TextStyle(
                color: AppColors.kF63939,
                fontSize: 16,
              ),
            ),
            Text(
              '2 items',
            ),
          ],
        ),
      ),
      separatorBuilder: (context, index) => const Divider(
        color: AppColors.kF63939,
        height: 0,
      ),
      itemCount: 20,
    );
  }

  Column buildEmptyHistoryView() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(AppAssets.noHistory),
        const SizedBox(height: 30),
        const Text(
          'No history yet',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          'Hit the button down\nbelow to Create an order',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 14),
        ),
      ],
    );
  }

  Column buildEmptyOrderView() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(AppAssets.noOrder),
        const SizedBox(height: 30),
        const Text(
          'No orders yet',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          'Hit the button down\nbelow to Create an order',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 14),
        ),
      ],
    );
  }

  Container buildTabContainer({
    required String title,
    Color? fontColor,
    Color? backgroundColor,
  }) {
    return Container(
      width: double.maxFinite,
      height: 35,
      padding: const EdgeInsets.all(4),
      decoration: ShapeDecoration(
        color: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(38),
        ),
      ),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: fontColor,
          fontSize: 17,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
