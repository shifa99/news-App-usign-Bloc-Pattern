import 'package:flutter/material.dart';
import 'package:news_app/Models/Article.dart';
import 'package:news_app/UI/Screens/ArticleDetialsScreen/ArticleDetailsScreen.dart';

Widget buildArticles(List<Article> articles) {
  return ListView.builder(
      itemCount: articles.length,
      itemBuilder: (context, index) =>
          buildArticleItem(context, articles[index]));
}

Widget buildArticleItem(BuildContext context, Article article) {
  return Container(
      margin: EdgeInsets.all(8),
      height: 300,
      width: double.infinity,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, ArticleDetailsScreen.routeName,
              arguments: article);
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Stack(
            children: [
              Container(
                height: 300,
                child: article.imageUrl == null
                    ? Center(child: Text('No Image'))
                    : Image.network(
                        article.imageUrl,
                        fit: BoxFit.fill,
                      ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: Container(
                  height: 100,
                  padding: EdgeInsets.all(2),
                  color: Colors.black.withOpacity(0.4),
                  child: ListTile(
                    title: Text(
                      article.title,
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ));
}
