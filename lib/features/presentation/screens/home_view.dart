import 'package:dummy_1/features/presentation/widgets/app_textfield.dart';
import 'package:dummy_1/constants/app_images.dart';
import 'package:flutter/widgets.dart';
import '../../../constants/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Scaffold(
        key: _scaffoldKey,
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
              onPressed: () {
                print('hello');
                _scaffoldKey.currentState?.openEndDrawer();
              },
              icon: const Icon(
                Icons.notifications_outlined,
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
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: AppTextFormField(
                      name: 'search',
                      showBorderRadius: true,
                      contentPadding: EdgeInsets.zero,
                      constraints: BoxConstraints.loose(
                        const Size(
                          double.maxFinite,
                          35,
                        ),
                      ),
                      hintText: 'Discover & Get Delicious Food',
                      borderRadius: 30,
                      preFixIcon: const Icon(
                        Icons.search,
                        color: AppColors.kF63939,
                      ),
                      fillColor: AppColors.kf9eeee,
                      validate: (value) {
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
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
        endDrawer: SizedBox(
          width: MediaQuery.of(context).size.width / 1.5,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(80),
              bottomLeft: Radius.circular(80),
            ),
            child: Drawer(
              backgroundColor: AppColors.kF63939,
              child: Column(
                children: <Widget>[
                  const DrawerHeader(
                    child: Row(
                      children: [
                        Icon(
                          Icons.notifications,
                          color: AppColors.kFFFFFF,
                          size: 30,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Notifications',
                          style: TextStyle(
                            color: AppColors.kFFFFFF,
                            fontSize: 24,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.separated(
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: Container(
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: AppColors.kFFFFFF,
                                borderRadius: BorderRadius.circular(10),
                                shape: BoxShape.rectangle,
                              ),
                              child: const Icon(
                                Icons.shop_outlined,
                                color: AppColors.kF63939,
                              )),
                          title: const Text(
                            'We have added a product you might like.',
                            style: TextStyle(color: AppColors.kFFFFFF),
                          ),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        );
                      },
                      separatorBuilder: (context, index) => const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Divider(
                          color: AppColors.kFFFFFF,
                          height: 0,
                        ),
                      ),
                      itemCount: 12,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
