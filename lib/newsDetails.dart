import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_application/model/newsResponse/news.dart';
import 'package:url_launcher/url_launcher.dart';

class newsDetails extends StatelessWidget {
  static const String routeName = 'newDetails';

  @override
  Widget build(BuildContext context) {
    var news = ModalRoute
        .of(context)
        ?.settings
        .arguments as News;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90,
        title: Text("Live News"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(18),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: CachedNetworkImage(
                imageUrl: news.urlToImage ?? "",
                height: 220,
                width: double.infinity,
                fit: BoxFit.fill,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    Center(
                        child: CircularProgressIndicator(
                            value: downloadProgress.progress)),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  child: Text(
                    news.author ?? "",
                    textAlign: TextAlign.start,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              news.title ?? "",
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(news.publishedAt ?? "", textAlign: TextAlign.end),
              ],
            ),
            SizedBox(height: 15,),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(news.content!, style: TextStyle(fontSize: 20),)
              ],),
            SizedBox(height: 15,),
            InkWell(
              onTap: () => _launchUrl(news.url ?? ""),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("View full article"),
                  Icon(Icons.arrow_forward)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _launchUrl(String url) async {
    var uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $url');
    }
  }
}
