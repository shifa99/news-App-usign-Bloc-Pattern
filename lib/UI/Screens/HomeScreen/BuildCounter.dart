import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Data/Bloc.dart';
import 'package:news_app/Data/CounterEvent.dart';
import 'package:news_app/Data/CounterState.dart';

class BuildCounter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('rebuild');
    BlocCounter blocCounter = BlocProvider.of<BlocCounter>(context);
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
              icon: Icon(
                Icons.add,
                color: Colors.teal,
              ),
              onPressed: () {
                blocCounter.add(increamentEvent());
              }),
          BlocBuilder<BlocCounter, CounterState>(builder: (context, state) {
            print(blocCounter.counter);
            return Text('${blocCounter.counter}');
          }),
          IconButton(
              icon: Icon(
                Icons.remove,
                color: Colors.teal,
              ),
              onPressed: () {
                blocCounter.add(decreamentEvent());
              }),
        ],
      ),
    );
  }
}
