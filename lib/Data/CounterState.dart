abstract class CounterState {}

class CounterInitialState extends CounterState {}

class CounterChangeState extends CounterState {
  String chCounter;
  CounterChangeState(this.chCounter);
}
