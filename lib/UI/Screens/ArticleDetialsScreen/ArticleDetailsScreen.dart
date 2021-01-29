import 'package:flutter/material.dart';
import 'package:news_app/Models/Article.dart';
import 'package:news_app/Models/Constants.dart';
import 'package:news_app/Models/Responsive.dart';
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
          Container(
            height: MediaQuery.of(context).size.height * 0.25 -
                getSize(context) -
                5,
            padding: EdgeInsets.all(5),
            child: Text(
              article.title,
              style: kmainStyle,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
            height: MediaQuery.of(context).size.height * 0.4 -
                getSize(context) -
                25,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                article.imageUrl,
                // height: 300,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            height: MediaQuery.of(context).size.height * 0.2 -
                getSize(context) -
                25,
            child: Text(
              article.description,
              style: ksecondaryStyle,
            ),
          ),
          Spacer(),
          buildButtonLuanch(context, lauchPressed: () {
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
