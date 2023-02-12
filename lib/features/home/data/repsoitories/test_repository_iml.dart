import 'package:flutter/foundation.dart';
import 'package:testapp/core/constants/warnings.dart';
import 'package:testapp/core/error/exceptions.dart';
import 'package:testapp/core/platform/network_info.dart';
import 'package:testapp/features/home/data/datasourse/remote/test_remote_datasourse.dart';
import 'package:testapp/features/home/domain/entitites/test_entity.dart';
import 'package:testapp/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:testapp/features/home/domain/repository/test_repository.dart';

class TestRepsotoryImpl extends TestRepsitory{
  final TestDataSource testDataSource;
  final NetworkInfo networkInfo;
  TestRepsotoryImpl({required this.testDataSource,required this.networkInfo});
  
  @override
  Future<Either<Failure, List <ProductEntity>>> getIncomeTable(bool isCache) async{
    if (!isCache) {
      bool isConnected = await networkInfo.isConnected;
      if (!isConnected) {
        return Left(NoInternetFailure());
      }
      try {
        final response = await testDataSource.getRequestCash();
        
        return Right(response.toEntity());
      } catch (e, s) {
        if (kDebugMode) {
          print("Error Structure $e $s");
        }
        return Left(ServerFailure(message: e.toString()));
      }
    } else {
      try {
        final response = await testDataSource.getRequestCash();
        return Right(response.toEntity());
      } catch (e, s) {
        if (kDebugMode) {
          print("Error Structure $e $s");
        }
        return Left(
          CacheFailure(
            message:
                (e is CacheException) ? e.message : Warnings.somethingWentWrong,
          ),
        );
      }
    }
  }

  
  
}