import 'package:flutter/material.dart';
import 'package:news_app/Models/Article.dart';
import 'package:news_app/Models/Constants.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticleDetailsScreen extends StatelessWidget {
  static final routeName = 'ArticleDetails';
  @override
  Widget build(BuildContext context) {
    final article = ModalRoute.of(context).settings.arguments as Article;
    return Scaffold(
      appBar: AppBar(
        title: Text('زاجل'),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
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
          Expanded(
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: RaisedButton(
                elevation: 0,
                padding: EdgeInsets.zero,
                color: Colors.teal,
                onPressed: () {
                  _launchUrl(article.contentUrl);
                },
                child: Text(
                  'أضغط هنا لمشاهدة التفاصيل',
                  style: ksecondaryStyle,
                ),
              ),
            ),
          )
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
