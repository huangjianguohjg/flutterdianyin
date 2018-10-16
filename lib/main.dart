import 'package:flutter/material.dart';
import 'bottomNavigation.dart';
void main() => runApp(new MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'hjg的项目',
      theme: new ThemeData(
        primarySwatch: Colors.red,
      ),
      home: bottomNavigationWidget(),
    );
  }
}
