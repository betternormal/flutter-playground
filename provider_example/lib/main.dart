import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/provider/task_data_provider.dart';
import 'package:provider_example/screens/task_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider( // 여러개의 상태를 관리할 때 사용
      providers: [
        ChangeNotifierProvider(create: (_) => TaskDataProvider()),
      ],
      child: MaterialApp(
        home: TasksScreen(),
      ),
    );
  }
}
