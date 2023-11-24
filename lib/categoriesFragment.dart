import 'package:flutter/material.dart';

import 'categories.dart';
import 'categoriesItem.dart';

typedef OnCategoryClick = void Function(Category category);

class categoriesFragment extends StatelessWidget {
  List<Category> categories = Category.getAllCategory();

   OnCategoryClick onCategoryClick;

   categoriesFragment(this.onCategoryClick ,{super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisSpacing: 24, crossAxisSpacing: 22),
              itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    onCategoryClick(categories[index]);
                  }, child: CategoryItem(categories[index], index)),
              itemCount: categories.length,
            ),
          )
        ],
      ),
    );
  }
}
