import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Data/APiData.dart';
import 'package:news_app/Data/ArticlesEvents.dart';
import 'package:news_app/Data/ArticlesStates.dart';
import 'package:news_app/Models/Article.dart';

class BlocArticles extends Bloc<ArticlesEvents, ArticlesStates> {
  ApiData apiData = ApiData();
  List<Article> listArticles;
  BlocArticles(ArticlesStates initialState) : super(initialState);

  @override
  Stream<ArticlesStates> mapEventToState(ArticlesEvents event) async* {
    if (event.category != null) apiData = ApiData(category: event.category);
    yield LoadingState();
    try {
      listArticles = await apiData.fetchDataFromAPI('eg');
      yield LoadedState(listArticles);
    } catch (e) {
      yield ErrorState(e.toString());
    }
  }
}
