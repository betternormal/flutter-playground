import 'package:flutter/material.dart';
import 'package:http_network/screens/network_example.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'http_network',
      theme: ThemeData.dark(),
      home: NetworkExample(),
    );
  }
}
