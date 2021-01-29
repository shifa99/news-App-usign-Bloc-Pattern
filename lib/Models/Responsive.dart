import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:news_app/Models/Constants.dart';

double getSize(BuildContext context, double height) {
  double paddingTop =
      MediaQuery.of(context).padding.top + appBar.preferredSize.height;
  double heightCreated = MediaQuery.of(context).size.height * height;
  return (paddingTop - heightCreated).abs();
}
