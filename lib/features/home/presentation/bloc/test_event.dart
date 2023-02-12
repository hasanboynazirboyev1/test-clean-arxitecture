part of 'test_bloc.dart';

abstract class TestEvent extends Equatable {
  const TestEvent();

  @override
  List<Object> get props => [];
}
class TestInitialEvent extends TestEvent{}
class TestRequestEvent extends TestEvent{}
class TestLoadEvent extends TestEvent {
  const TestLoadEvent();

  @override
  List<Object> get props => [];
}
 
