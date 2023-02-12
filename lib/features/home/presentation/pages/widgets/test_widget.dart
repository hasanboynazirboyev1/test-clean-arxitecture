import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'package:testapp/features/home/domain/entitites/test_entity.dart';
import 'package:testapp/features/home/presentation/bloc/test_bloc.dart';

class TestWidget extends StatelessWidget {
  final List<ProductEntity> testProd;
    final TestBloc bloc;
  const TestWidget({super.key, required this.testProd,required this.bloc});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverList(
            delegate: SliverChildBuilderDelegate(childCount: 4,
                (context, index) {
          return ListTile(
            title: Text(testProd[index].title!),
            subtitle: Text(testProd[index].description!),
            leading: Text(testProd[index].id!.toString()),
            
          );
        }))
      ],
    );
  }
}
