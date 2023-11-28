import 'package:flutter/material.dart';
import 'package:news_application/API/ApiManager.dart';

import '../model/newsResponse/news.dart';

class NewsListViewModel extends ChangeNotifier {
  bool? showLoading;
  List<News>? newsList;
  String? errorMessage;

  void getNews(sourceId) async {
    showLoading = true;
    errorMessage = null;
    newsList = null;

    notifyListeners();
    try {
      var response = await apiManager.getNews(sourceId);
      showLoading = false;
      if (response.status == 'error') {
        errorMessage = response.message;
      } else {
        newsList = response.articles;
      }
    } catch (e) {
      showLoading = false;
      errorMessage = e.toString();
    }
    notifyListeners();
  }
}
