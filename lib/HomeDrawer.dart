import 'package:flutter/material.dart';

typedef OnMenuClick = void Function(MenuItem clickeditem);

class homeDrawer extends StatelessWidget {
  @override
   OnMenuClick onMenuClick;

  homeDrawer(this.onMenuClick);

  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 55),
            alignment: Alignment.center,
            color: Colors.indigo,
            child: const Text(
              "News App",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
          ),
          InkWell(
            onTap: () {
              onMenuClick(MenuItem.categories);
            },
            child: Container(
              margin: EdgeInsets.all(25),
              child: const Row(
                children: [
                  Icon(Icons.list),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Categories",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              onMenuClick(MenuItem.contactUs);
            },
            child: Container(
              margin: EdgeInsets.all(25),
              child: const Row(
                children: [
                  Icon(Icons.contact_support),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Contact us",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


enum MenuItem{
  categories,
  contactUs
}
