import 'package:flutter/material.dart';
import 'package:news_app/Models/Constants.dart';

Widget buildButtonLuanch({Function lauchPressed}) {
  return Expanded(
    child: SizedBox(
      width: double.infinity,
      height: 50,
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
    ),
  );
}
