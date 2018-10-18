import 'package:flutter/material.dart';
import 'pages/homepage.dart';
import 'pages/minePage.dart';
import 'pages/secondPage.dart';
import 'pages/thirdPage.dart';

class bottomNavigationWidget extends StatefulWidget {
  @override
  _bottomNavigationWidgetState createState() => _bottomNavigationWidgetState();
}

class _bottomNavigationWidgetState extends State<bottomNavigationWidget> {

  //初始化常量
  final _bottomNavigationColor = Colors.red;
  int _currentIndex = 0;
  List<Widget> list = List();

  @override
  void initState(){
    list
        ..add(homepageScreen())
        ..add(secondPageScreen())
        ..add(thirdPageScreen())
        ..add(mineScreen());
    super.initState();

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: list[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: Colors.red,
                ) ,
                title:Text(
                  '首页',
                  style: TextStyle(color: _bottomNavigationColor),
                )),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.email,
                color: _bottomNavigationColor,
              ),
              title: Text(
                '第二页',
                style: TextStyle(color: _bottomNavigationColor),
              )
            ),
            BottomNavigationBarItem(
              icon:Icon(
                Icons.school,
                color: _bottomNavigationColor,
              ),
              title: Text(
                '第三页',
                style: TextStyle(color: _bottomNavigationColor),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                  Icons.label,
                color: _bottomNavigationColor,
              ),
              title: Text(
                '我的',
                style: TextStyle(color: _bottomNavigationColor),
              ),
            ),
          ],
          currentIndex: _currentIndex,
          onTap: (int index){
            setState((){
              _currentIndex=index;
            });
          },
        type: BottomNavigationBarType.shifting,
      ),
    );
  }
}
