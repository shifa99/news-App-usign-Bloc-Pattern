import 'package:flutter/material.dart';
import 'package:news_app/Models/Constants.dart';
import 'package:news_app/Models/Responsive.dart';

Widget buildButtonLuanch(BuildContext context, {Function lauchPressed}) {
  return SizedBox(
    width: double.infinity,
    height: MediaQuery.of(context).size.height * 0.2 - getSize(context) - 25,
    child: RaisedButton(
      elevation: 0,
      padding: EdgeInsets.zero,
      color: Colors.teal,
      onPressed: lauchPressed,
      child: Text(
        'أضغط هنا لمشاهدة التفاصيل',
        style: ksecondaryStyle,
      ),
    ),
  );
}
