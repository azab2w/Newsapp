import 'package:flutter/material.dart';
import 'package:news_application/API/ApiManager.dart';
import 'package:news_application/categories.dart';
import 'package:news_application/categoriesDetails/sourcelistWidget.dart';

class CategoriesDetails extends StatelessWidget {
  Category category;
  CategoriesDetails(this.category, {super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: apiManager.getSources(category.id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError || snapshot.data?.status == 'error') {
          return Center(
            child: Column(
              children: [
                Text(snapshot.data?.message ?? snapshot.error.toString()),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Try again'))
              ],
            ),
          );
        }
        var SourcesList = snapshot.data?.sources;
        return SourceTabsWidget(SourcesList!);
      },
    );
  }
}
