import 'package:dio/dio.dart';
import 'package:testapp/features/home/data/datasourse/remote/test_remote_datasourse.dart';
import 'package:testapp/features/home/data/models/test_model.dart';

class TestRemoteDatasorseImpl extends TestDataSource{
   final Dio dio;
   TestRemoteDatasorseImpl({required this.dio});
  @override
  Future<TestModel> getRequestCash()async {
    final res = await dio.get('https://dummyjson.com/products');
    return TestModel.fromJson(res.data);
  }
}