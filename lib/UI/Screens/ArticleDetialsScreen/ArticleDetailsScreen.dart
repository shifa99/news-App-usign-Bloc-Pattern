import 'package:flutter/material.dart';
import 'package:news_app/Models/Article.dart';
import 'package:news_app/Models/Constants.dart';
import 'package:news_app/UI/Screens/ArticleDetialsScreen/BuildButtonLaunch.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticleDetailsScreen extends StatelessWidget {
  static final routeName = 'ArticleDetails';
  @override
  Widget build(BuildContext context) {
    final article = ModalRoute.of(context).settings.arguments as Article;
    return Scaffold(
      appBar: appBar,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
            child: Text(
              article.title,
              style: kmainStyle,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
            height: 300,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                article.imageUrl,
                height: 300,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              article.description,
              style: ksecondaryStyle,
            ),
          ),
          Spacer(),
          buildButtonLuanch(lauchPressed: () {
            _launchUrl(article.contentUrl);
          }),
        ],
      ),
    );
  }

  void _launchUrl(String url) async {
    if (await canLaunch(url))
      await launch(url);
    else
      throw Exception();
  }
}
