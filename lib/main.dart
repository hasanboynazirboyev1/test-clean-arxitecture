import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testapp/features/home/presentation/bloc/test_bloc.dart';
import 'package:testapp/features/home/presentation/pages/test_page.dart';
import 'package:testapp/features/main_home/bloc/main_bloc.dart';
import 'package:testapp/features/main_home/test_main_page.dart';
import 'package:testapp/injector_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  if (kDebugMode) {
    Bloc.observer = di.LogBlocObserver();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TestPage(),
    );
  }
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
