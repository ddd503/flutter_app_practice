import 'package:flutter/material.dart';

void main() => runApp(MyApp());

const _padding = EdgeInsets.all(16.0);

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
        body: HelloWarldRactangle(),)
    );
  }
}

class HelloWarldRactangle extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 300,
        height: 400,
        color: Colors.green,
        alignment: Alignment.center,
        child: Text(
          'Hello!',
          style: Theme.of(context).textTheme.display2,
        ),
      ),
    );
  }
}