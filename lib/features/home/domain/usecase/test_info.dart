import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:testapp/core/error/failure.dart';
import 'package:testapp/core/usecase/test_usecase.dart';
import 'package:testapp/features/home/domain/entitites/test_entity.dart';
import 'package:testapp/features/home/domain/repository/test_repository.dart';

class TestInfoUseCase extends UseCase<List<ProductEntity>, Params> {
  final TestRepsitory testRepsitory;
  TestInfoUseCase(this.testRepsitory);
  @override
  Future<Either<Failure, List<ProductEntity>>> call(Params params) async {
    final response = await testRepsitory.getIncomeTable(params.isCache);
    return response;
  }
}

class Params extends Equatable {
  final bool isCache;

  const Params({
    required this.isCache,
  });

  @override
  List<Object?> get props => [
        isCache,
      ];
}
