import 'package:flutter/material.dart';
import 'package:news_app/Data/ArticlesEvents.dart';
import 'package:news_app/Data/BlocArticles.dart';
import 'package:news_app/Models/Categories.dart';

Widget buildCategories(BlocArticles blocArticles) {
  return ListView.builder(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.all(8),
      itemCount: categoriesKeys.length,
      itemBuilder: (context, position) => Container(
            margin: EdgeInsets.symmetric(horizontal: 5),
            padding: EdgeInsets.all(10),
            child: RaisedButton(
                color: Colors.teal,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                child: Text(
                  categoriesValues[position],
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                onPressed: () {
                  blocArticles.add(
                      FetchDataFromAPI(category: categoriesKeys[position]));
                }),
          ));
}
