import 'package:dartz/dartz.dart';
import 'package:testapp/core/error/failure.dart';
import 'package:testapp/features/home/domain/entitites/test_entity.dart';
import 'package:testapp/features/home/domain/usecase/test_info.dart';

abstract class TestRepsitory {
  Future<Either<Failure, List<ProductEntity>>> getIncomeTable(bool isCache);
}
