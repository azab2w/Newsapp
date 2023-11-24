import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_application/API/sourcesResponse/SourcesResponse.dart';
import 'package:news_application/model/newsResponse/NewsResponse.dart';

class apiManager {
  static const baseUrl = 'newsapi.org';
  static const ApiKey = "273329a6694a4a8ba34282045c7c0194";

  static Future<SourcesResponse> getSources(String categoryId) async {
    var uri = Uri.https(baseUrl, 'v2/top-headlines/sources',
        {"apiKey": ApiKey, "category": categoryId});
    var response = await http.get(uri);
    print(response.body);
    var json = jsonDecode(response.body);

    var sourceResponse = SourcesResponse.fromJson(json);

    return sourceResponse;
  }
  static Future<NewsResponse> getNews(String? sourceId) async{

    var url = Uri.https(baseUrl , 'v2/everything' , {
      "apiKey" : ApiKey,
      "sources" : sourceId
    } );

    var response = await http.get(url);
    var json = jsonDecode(response.body);
    var newresponse = NewsResponse.fromJson(json);

    return newresponse;
    
  }
}
