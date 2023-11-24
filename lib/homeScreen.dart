import 'package:flutter/material.dart';
import 'package:news_application/categoriesDetails/categoriesDetails.dart';
import 'HomeDrawer.dart';
import 'ContactUsFragment.dart';
import 'categories.dart';
import 'categoriesFragment.dart';

class HomeScreen extends StatefulWidget {
  static const RouteName = 'HomeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    selectedWidget = categoriesFragment(onCategoryItemClick);
  }

  Widget build(BuildContext context) {

    return Scaffold(
      drawer: homeDrawer(onMenuItemClick),
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        centerTitle: true,
        title: Text("Live News"),
        toolbarHeight: 80,
      ),
      body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/pattern.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: selectedWidget),
    );
  }

  late Widget selectedWidget;

  void onMenuItemClick(MenuItem item) {
    Navigator.pop(context);
    switch (item) {
      case MenuItem.categories:
        {
          selectedWidget = categoriesFragment(onCategoryItemClick);
        }
      case MenuItem.contactUs:
        {
          selectedWidget = ContactUsFragment();
        }
    }
    setState(() {});
  }

  void onCategoryItemClick(Category category) {
    selectedWidget = CategoriesDetails(category);
    setState(() {});
  }
}
