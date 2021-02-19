part of 'counter_bloc.dart';

abstract class CounterEvent extends Equatable {
  const CounterEvent();

  @override
  List<Object> get props => [];
}

class ModifyCounter extends CounterEvent {
  final bool isIncrement;

  ModifyCounter({@required this.isIncrement});

  @override
  List<Object> get props => [isIncrement];
}
