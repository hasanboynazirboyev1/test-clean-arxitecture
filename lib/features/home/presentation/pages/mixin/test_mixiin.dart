part of '../test_page.dart';

class TestMixin {
  late final TestBloc _bloc;
  late List<ProductEntity> testProd;
  late TextEditingController statusController;
  late TestDataSource testDataSource;
  
  void initContext(BuildContext context) {
    _bloc = context.read<TestBloc>();
    _bloc.add(const TestLoadEvent());
  }

  void disposeController() {
    _bloc.close();
  }
}