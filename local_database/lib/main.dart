import 'package:flutter/material.dart';
import 'package:local_database/screens/local_database.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized(); // 플랫폼채널 비동기작업에서 위젯의 안정성을 보장 1.스플래쉬 화면, 2.sqflite에서 사용
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'local database',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: LocalDatabase()
    );
  }
}
