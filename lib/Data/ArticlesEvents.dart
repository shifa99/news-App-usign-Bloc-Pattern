abstract class ArticlesEvents {
  final String category;

  ArticlesEvents(this.category);
}

class FetchDataFromAPI extends ArticlesEvents {
  FetchDataFromAPI({String category}) : super(category);
}
