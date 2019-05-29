import 'package:flutter/material.dart';
import 'package:flutter_app_practice/category.dart';
import 'package:flutter_app_practice/unit.dart';

final _backgroundColor = Colors.green[100];

class CategoryRoute extends StatelessWidget {
  const CategoryRoute();

  static const _categoryNames = <String>[
    'Length',
    'Area',
    'Volume',
    'Mass',
    'Time',
    'Digital Storage',
    'Energy',
    'Currency',
  ];

  static const _baseColors = <Color>[
    Colors.teal,
    Colors.orange,
    Colors.pinkAccent,
    Colors.blueAccent,
    Colors.yellow,
    Colors.greenAccent,
    Colors.purpleAccent,
    Colors.red,
  ];

  // ListViewの用意（セル生成とセルの数を定義　categoriesが抽象値でbuild時に作る？？）
  Widget _buildCategoryWidgets(List<Widget> categories) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) => categories[index], // セル生成 ctegoriesのindex番目をセルにする
      itemCount: categories.length, // セルの数（lengthは配列の個数）
    );
  }

  //（Strign -> [Unit]的なやつ）
  List<Unit> _retrieveUnitList(String categoryName) {
    return List.generate(10, (int i) {
      i += 1;
      return Unit(
        name: '$categoryName Unit $i',
        conversion: i.toDouble(),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    // 空の配列を用意(Categoryの配列)
    final categories = <Category>[];

    // 配列にCategoryを詰める
    for (var i = 0; i < _categoryNames.length; i++) {
      categories.add(Category(
        name: _categoryNames[i],
        color: _baseColors[i],
        iconLocation: Icons.cake,
        // injectに必要なUnitクラスの配列を文字列(_categoryNames)の要素を元に作る（Strign -> [Unit]的なやつ）
        units: _retrieveUnitList(_categoryNames[i]),
      ));
    }

    // ListViewの定義、必要な情報はchildにセットする
    final listView = Container(
      color: _backgroundColor,
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: _buildCategoryWidgets(categories),
    );

    // Headerを作る（この場合、appbarはheaderになる）
    final appBar = AppBar(
      elevation: 0.0,
      title: Text(
        'Unit Converter',
        style: TextStyle(
          color: Colors.black,
          fontSize: 30.0,
        ),
      ),
      centerTitle: true,
      backgroundColor: _backgroundColor,
    );

    // 画面に作った要素を描画
    return Scaffold(
      appBar: appBar,
      body: listView,
    );
  }
}