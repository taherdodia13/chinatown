import 'package:dummy_1/constants/app_images.dart';
import '../../../constants/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Scaffold(
        backgroundColor: AppColors.kf2f2f2,
        appBar: AppBar(
          backgroundColor: AppColors.kFFFFFF,
          title: const Column(
            children: [
              Text(
                'Hello User👋🏻',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: AppColors.kF63939,
                ),
              ),
              Text(
                'Welcome',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.k000000,
                ),
              ),
            ],
          ),
          centerTitle: false,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.shopping_cart_rounded,
                size: 30,
                color: AppColors.kF63939,
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 3,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: AppColors.kFFFFFF,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: SizedBox(
                      height: 170,
                      child: PageView.builder(
                        controller: PageController(viewportFraction: 0.8),
                        itemBuilder: (context, index) {
                          return Image.asset(AppAssets.banner);
                        },
                        itemCount: 3,
                        scrollBehavior: const CupertinoScrollBehavior(),
                      ),
                    ),
                  ),
                  const TabBar(
                    dividerColor: Colors.transparent,
                    unselectedLabelColor: AppColors.k000000,
                    labelColor: AppColors.kF63939,
                    labelPadding: EdgeInsets.symmetric(vertical: 10),
                    indicatorColor: AppColors.kF63939,
                    indicatorSize: TabBarIndicatorSize.label,
                    tabs: <Widget>[
                      Text(
                        'Non-Veg',
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        'Veg',
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        'Beverages',
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Expanded(
              flex: 3,
              child: TabBarView(
                children: <Widget>[
                  SingleChildScrollView(child: Column()),
                  SingleChildScrollView(child: Column()),
                  SingleChildScrollView(child: Column()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
