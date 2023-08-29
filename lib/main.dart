import 'package:flutter/material.dart';
import 'package:first_project_focus/screen/reward_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('마이 페이지'),
        ),
        body: ImageGrid(),
      ),
    );
  }
}