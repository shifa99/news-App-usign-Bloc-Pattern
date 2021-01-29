import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Data/ArticlesEvents.dart';
import 'package:news_app/Data/ArticlesStates.dart';
import 'package:news_app/Data/BlocArticles.dart';
import 'package:news_app/Models/Constants.dart';
import 'package:news_app/Models/Responsive.dart';
import 'package:news_app/UI/Screens/HomeScreen/BuildCategories.dart';

import 'BuildArticlesList.dart';
import 'BuildLoading.dart';

class HomeScreen extends StatefulWidget {
  static final routeName = '/';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  BlocArticles _blocArticles;
  @override
  void initState() {
    _blocArticles = BlocProvider.of<BlocArticles>(context);
    _blocArticles.add(FetchDataFromAPI());
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: Column(children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: getSize(context, 0.2),
          child: buildCategories(_blocArticles),
        ),
        Container(
          height: getSize(context, 0.9),
          child: BlocBuilder<BlocArticles, ArticlesStates>(
              builder: (context, state) {
            if (state is InitialState)
              return buildLoading();
            else if (state is LoadingState)
              return buildLoading();
            else if (state is LoadedState)
              return buildArticles(_blocArticles.listArticles);
            else if (state is ErrorState) return buildErrorMessage();
          }),
        ),
      ]),
    );
  }
}

Widget buildErrorMessage() {
  return Center(
    child: Text(
      'Some Errors Appear try again later',
      style: TextStyle(fontSize: 20),
    ),
  );
}
