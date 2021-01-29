import 'package:equatable/equatable.dart';

enum counterEvent { add, remove }

abstract class CounterEvent {
  const CounterEvent();
}

// ignore: camel_case_types
class increamentEvent extends CounterEvent {}

// ignore: camel_case_types
class decreamentEvent extends CounterEvent {}
