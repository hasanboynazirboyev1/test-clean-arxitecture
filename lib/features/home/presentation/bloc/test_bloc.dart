import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:testapp/features/home/domain/entitites/test_entity.dart';
import 'package:testapp/features/home/domain/usecase/test_info.dart';

part 'test_event.dart';
part 'test_state.dart';

class TestBloc extends Bloc<TestEvent, TestHomePageState> {
  final TestInfoUseCase testInfoUseCase;
  TestBloc({required this.testInfoUseCase})
      : super(const TestHomePageState(
            status: RequestStatus.initial,
            tableStatus: RequestStatus.initial)) {
    on<TestLoadEvent>(_onExpensesLoad);
  }

  Future<void> _onExpensesLoad(
      TestLoadEvent event, Emitter<TestHomePageState> emit) async {
    emit(
      state.copyWith(
        status: RequestStatus.loading,
        tableStatus: RequestStatus.loading,
      ),
    );
    final result = await testInfoUseCase(
      const Params(isCache: true),
    );
    _cachesTable(result, emit, true);
    final response = await testInfoUseCase(
      const Params(isCache: false),
    );
    _cachesTable(response, emit, false);
  }

  void _cachesTable(response, Emitter<TestHomePageState> emit, bool isCache) {
    response.fold(
      (error) {
        emit(
          state.copyWith(
            status: isCache ? state.status : RequestStatus.success,
            tableStatus: isCache ? state.status : RequestStatus.error,
          ),
        );
      },
      (r) {
        return emit(
          state.copyWith(
            status: isCache ? RequestStatus.success : RequestStatus.success,
            tableStatus:
                isCache ? RequestStatus.success : RequestStatus.success,
          ),
        );
      },
    );
  }
}

enum RequestStatus { initial, loading, error, success }
