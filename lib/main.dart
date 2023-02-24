import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:paymi/pages/homa_page.dart';
import 'package:paymi/pages/mainView.dart';
import 'package:paymi/storage/storage.dart';
import 'package:hive_flutter/adapters.dart';
import 'models/todoListModel.dart';

Future<void> main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(TodoListModelAdapter());

  box = await Hive.openBox('todolist');
  user = await Hive.openBox('user');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainView(),
      routes: {
        '/HomePage': (context) => const HomePage(),
        '/MainView': (context) => const MainView(),
      },
    );
  }
}
