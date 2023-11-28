import 'package:flutter/material.dart';
import 'package:news_application/categories.dart';
import 'package:news_application/categoriesDetails/CategoriesDetailsViewModel.dart';
import 'package:news_application/categoriesDetails/sourcelistWidget.dart';
import 'package:provider/provider.dart';

class CategoriesDetails extends StatefulWidget {
  Category category;
  CategoriesDetails(this.category, {super.key});
  @override
  State<CategoriesDetails> createState() => _CategoriesDetailsState();
}

class _CategoriesDetailsState extends State<CategoriesDetails> {
  var viewModel = CategoriesDetailsViewModel();
  @override
  void initState() {
    super.initState();
    viewModel.getSources(widget.category.id);

  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Consumer<CategoriesDetailsViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.showLoading == true) {
            return Center(child: CircularProgressIndicator());
          } else if (viewModel.errormessage != null) {
            return Center(
              child: Column(
                children: [
                  Text(viewModel.errormessage ??""),
                  ElevatedButton(
                      onPressed: () {
                        viewModel.getSources(widget.category.id??"");
                      },
                      child: Text('Try again'))
                ],
              ),
            );
          }
          var SourcesList = viewModel.newSourceList;
          return SourceTabsWidget(SourcesList!);
        },
      ),
    );

    // return FutureBuilder(
    //   future: apiManager.getSources(category.id),
    //   builder: (context, snapshot) {
    //     if (snapshot.connectionState == ConnectionState.waiting) {
    //       return Center(child: CircularProgressIndicator());
    //     } else if (snapshot.hasError || snapshot.data?.status == 'error') {
    //       return Center(
    //         child: Column(
    //           children: [
    //             Text(snapshot.data?.message ?? snapshot.error.toString()),
    //             ElevatedButton(
    //                 onPressed: () {
    //                   Navigator.pop(context);
    //                 },
    //                 child: Text('Try again'))
    //           ],
    //         ),
    //       );
    //     }
    //     var SourcesList = snapshot.data?.sources;
    //     return SourceTabsWidget(SourcesList!);
    //   },
    // );
  }
}
