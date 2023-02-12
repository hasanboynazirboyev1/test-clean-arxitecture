import 'package:testapp/features/home/data/models/test_model.dart';

abstract class TestDataSource {
  Future<TestModel> getRequestCash();
}