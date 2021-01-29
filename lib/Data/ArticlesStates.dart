import 'package:news_app/Models/Article.dart';

abstract class ArticlesStates {}

class InitialState extends ArticlesStates {
  List<Article> articles = [];
}

class LoadingState extends ArticlesStates {
  List<Article> articles = [];
}

class LoadedState extends ArticlesStates {
  final List<Article> articles;
  LoadedState(this.articles);
}

class ErrorState extends ArticlesStates {
  final String errorMessage;
  ErrorState(this.errorMessage);
}
