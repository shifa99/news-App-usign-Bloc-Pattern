import 'package:flutter/cupertino.dart';
import 'package:news_app/Models/Constants.dart';

double getSize(BuildContext context) {
  final aboveAppBar = MediaQuery.of(context).padding.top;
  final heightAppBar = appBar.preferredSize.height;
  return (heightAppBar - aboveAppBar).abs();
}
