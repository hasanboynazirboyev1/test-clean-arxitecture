import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testapp/features/home/data/datasourse/remote/test_remote_datasourse.dart';
import 'package:testapp/features/home/domain/entitites/test_entity.dart';
import 'package:testapp/features/home/presentation/bloc/test_bloc.dart';
import 'package:testapp/features/home/presentation/pages/widgets/test_widget.dart';
import 'package:testapp/features/main_home/bloc/main_bloc.dart';
import 'package:testapp/features/main_home/test_main_page.dart';
import 'package:testapp/injector_container.dart';
part 'mixin/test_mixiin.dart';

class TestPage extends StatelessWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<TestBloc>(),
      
      child: const TestPageBody(),
    );
  }
}

class TestPageBody extends StatefulWidget {
  const TestPageBody({Key? key}) : super(key: key);

  @override
  State<TestPageBody> createState() => TestPageBodyState();
}

class TestPageBodyState extends State<TestPageBody> with TestMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    initContext(context);
  }

  @override
  void dispose() {
    disposeController();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TestBloc, TestHomePageState>(
      listener: (_, state) {
        if (state.requestStatus == null || state.requestStatus!.isEmpty) {
          statusController.clear();
        }
        if (state.status == RequestStatus.success) {
          _bloc.add(const TestLoadEvent());
        }
      },
      builder: (_, state) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(title: const Text('Clean Axitecture')),
          body: state.status == RequestStatus.success
              ? TestWidget(
                  bloc: _bloc,
                  testProd: testProd,
                )
              : state.status == RequestStatus.loading
                  ? const Center(child: CircularProgressIndicator.adaptive())
                  : const SizedBox(),
        );
      },
    );
  }
}
