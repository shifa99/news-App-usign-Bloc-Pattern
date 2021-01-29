import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:news_app/Data/ArticlesStates.dart';
import 'package:news_app/Data/Bloc.dart';
import 'package:news_app/Data/BlocArticles.dart';
import 'package:news_app/Data/CounterState.dart';
import 'package:news_app/UI/Screens/ArticleDetialsScreen/ArticleDetailsScreen.dart';
import 'package:news_app/UI/Screens/HomeScreen/HomeScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => BlocCounter(CounterInitialState())),
        BlocProvider(create: (context) => BlocArticles(InitialState()))
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale('en', ''), // English, no country code
          const Locale('ar', ''), // Arabic, no country code
        ],
        locale: Locale('ar', ''),
        routes: {
          ArticleDetailsScreen.routeName: (context) => ArticleDetailsScreen(),
        },
        home: HomeScreen(),
      ),
    );
  }
}
