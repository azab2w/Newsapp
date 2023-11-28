import 'package:flutter/material.dart';
import 'package:news_application/news/NewsListViewModel.dart';
import 'package:provider/provider.dart';

import '../API/sourcesResponse/Source.dart';
import 'newsWidget.dart';

class newsListWidget extends StatefulWidget {
  Source source;

  newsListWidget(this.source, {super.key});

  @override
  State<newsListWidget> createState() => _newsListWidgetState();
}

class _newsListWidgetState extends State<newsListWidget> {
  @override
  var viewNewsModel = NewsListViewModel();

  void initState() {
    super.initState();
    viewNewsModel.getNews(widget.source.id ?? "");
  }

  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewNewsModel,
      child: Consumer<NewsListViewModel>(
        builder: (context, viewNewModel, child) {
          if (viewNewsModel.showLoading == true) {
            return const Center(child: CircularProgressIndicator());
          } else if (viewNewModel.errorMessage != null) {
            return Center(
              child: Column(
                children: [
                  Text(viewNewModel.errorMessage ?? ""),
                  ElevatedButton(
                      onPressed: () {
                        viewNewsModel.getNews(widget.source.id??"");
                      },
                      child: const Text("Try Again"))
                ],
              ),
            );
          }
          var newsList = viewNewsModel.newsList;
              return ListView.builder(
                itemBuilder: (context, index) {
                  return NewsWidget(newsList![index]);
                },
                itemCount: newsList?.length ?? 0,
              );
        },
      ),
    );

    // return FutureBuilder(
    //   future: apiManager.getNews(source.id),
    //   builder: (context, snapshot) {
    //     if (snapshot.connectionState == ConnectionState.waiting) {
    //       return Center(child: CircularProgressIndicator());
    //     } else if (snapshot.data?.status == 'error' || snapshot.hasError) {
    //       return Center(
    //         child: Column(
    //           children: [
    //             Text(snapshot.data?.message ?? snapshot.hasError.toString()),
    //             ElevatedButton(
    //                 onPressed: () {
    //                   Navigator.pop(context);
    //                 },
    //                 child: Text("Try again"))
    //           ],
    //         ),
    //       );
    //     }
    //     var newsList = snapshot.data?.articles;
    //     return ListView.builder(
    //       itemBuilder: (context, index) {
    //         return NewsWidget(newsList![index]);
    //       },
    //       itemCount: newsList?.length ?? 0,
    //     );
    //   },
    // );
  }
}
