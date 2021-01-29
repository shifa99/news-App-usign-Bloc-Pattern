import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Data/CounterEvent.dart';
import 'package:news_app/Data/CounterState.dart';

class BlocCounter extends Bloc<CounterEvent, CounterState> {
  int counter = 0;

  BlocCounter(CounterState initialState) : super(initialState);

  @override
  Stream<CounterState> mapEventToState(CounterEvent event) async* {
    if (event is increamentEvent) {
      print(event);
      yield _changeState('in');
    } else {
      if (event is decreamentEvent) {
        print(event);
        yield _changeState('de');
      }
    }
  }

  CounterState _changeState(String st) {
    switch (st) {
      case 'in':
        counter++;
        break;
      case 'de':
        counter--;
        break;
      default:
    }
    return CounterChangeState(st);
  }

  @override
  void onTransition(Transition<CounterEvent, CounterState> transition) {
    super.onTransition(transition);
    print(transition);
  }
}
