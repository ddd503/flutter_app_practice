import 'package:flutter/material.dart';
import 'package:flutter_app_practice/category.dart';

void main() => runApp(MyApp());

const _padding = EdgeInsets.all(16.0);
const _categoryName = 'Cake';
const _categoryIcon = Icons.cake;
const _categoryColor = Colors.green;

// 起動時の画面(homeの値は必須)
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Hello Warld'),
          backgroundColor: Colors.green,),
        backgroundColor: Colors.yellow[100],
        body: Category(name: _categoryName, color: _categoryColor, iconLocation: _categoryIcon),
      )
    );
  }
}
