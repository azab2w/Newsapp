import 'package:flutter/material.dart';
import 'package:news_application/API/ApiManager.dart';
import 'package:news_application/model/newsWidget.dart';

import 'API/sourcesResponse/Source.dart';

class newsListWidget extends StatelessWidget {
  Source source;
  newsListWidget(this.source, {super.key});
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: apiManager.getNews(source.id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.data?.status == 'error' || snapshot.hasError) {
          return Center(
            child: Column(
              children: [
                Text(snapshot.data?.message ?? snapshot.hasError.toString()),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Try again"))
              ],
            ),
          );
        }
        var newsList = snapshot.data?.articles;
        return ListView.builder(
          itemBuilder: (context, index) {
            return NewsWidget(newsList![index]);
          },
          itemCount: newsList?.length ?? 0,
        );
      },
    );
  }
}
