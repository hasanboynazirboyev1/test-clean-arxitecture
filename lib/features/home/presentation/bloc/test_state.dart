part of 'test_bloc.dart';

// abstract class TestState extends Equatable {
//   const TestState();

//   @override
//   List<Object> get props => [];
// }

// class TestInitial extends TestState {}
class TestHomePageState extends Equatable {
  final RequestStatus status;
  final RequestStatus tableStatus;
  final List<ProductEntity>? productEntity;

  final String? requestStatus;

  const TestHomePageState({
    required this.status,
    required this.tableStatus,
    this.productEntity = const [],
    this.requestStatus,
  });

  TestHomePageState copyWith({
    RequestStatus? status,
    RequestStatus? tableStatus,
    List<ProductEntity>? productEntity,
    int? selectedIndex,
    String? requestStatus,
  }) {
    return TestHomePageState(
      status: status ?? this.status,
      tableStatus: tableStatus ?? this.tableStatus,
      productEntity: productEntity ?? this.productEntity,
      requestStatus:
          requestStatus == "" ? null : requestStatus ?? this.requestStatus,
    );
  }

  @override
  List<Object?> get props => [
        status,
        tableStatus,
        productEntity,
     
        requestStatus,
      ];
}
