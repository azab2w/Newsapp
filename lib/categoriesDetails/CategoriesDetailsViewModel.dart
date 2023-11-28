import 'package:flutter/material.dart';
import 'package:news_application/API/ApiManager.dart';
import 'package:news_application/API/sourcesResponse/Source.dart';

class CategoriesDetailsViewModel extends ChangeNotifier {
   List<Source>? newSourceList;
  String? errormessage;
  bool? showLoading = true;
  void getSources(categoryId) async {
    showLoading = true;
    newSourceList = null;
    errormessage = null;
    notifyListeners();
    try {
      var response = await apiManager.getSources(categoryId);
      showLoading = null;
      if (response.status == 'error') {
        errormessage = response.message;
      } else {
        newSourceList = response.sources!;
      }
    } catch (e) {
      showLoading = null;
      errormessage = e.toString();
    }
    notifyListeners();
  }
}
