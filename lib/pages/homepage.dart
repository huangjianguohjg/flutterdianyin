import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

//
//class homePageScreen extends StatelessWidget{
//  @override
//  Widget build (BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(title: Text('主页'),),
//    );
//  // ignore: strong_mode_invalid_method_override
//  }
//}

class homepageScreen extends StatefulWidget {
  @override
  _homepageScreenState createState() => _homepageScreenState();
}

class _homepageScreenState extends State<homepageScreen> {
  ScrollController _controller;
  List<String> images;

  @override
  void initState(){
    super.initState();
    images = List();
    _controller = ScrollController();
    //网络请求
    fetchTen();
    _controller.addListener((){
      if(_controller.position.pixels == _controller.position.maxScrollExtent){
        //这里面放网络请求
        fetchTen();
      }
    });

  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('首页2'),
      ),
      body: RefreshIndicator(
          child : GridView.builder(
              gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 10.0,
                  childAspectRatio: 1.0,

              ),
              controller: _controller,
              itemCount: images.length,
              itemBuilder: (BuildContext context,int index){
                return _buildItem(images[index]);
              }),
          onRefresh: () async{
            await new Future.delayed(const Duration(seconds: 1));
            images.clear();
            fetchTen();
          }),
    );
  }


  Widget _buildItem(String url){
    return Container(
      constraints: BoxConstraints.tightFor(height: 150.0),
      child: Image.network(
        url,
        fit: BoxFit.cover,
      ),
    );
  }

  fetch() async{

    final response = await http.get('http://dog.ceo/api/breeds/image/random');
    if(response.statusCode == 200){
      print(json.decode(response.body));
      setState(() {
        images.add(json.decode(response.body)['message'],);
      });
    }else{
      throw Exception('fail');
    }

  }

  fetchTen(){
    for(int i=0;i < 10;i ++ ){
      fetch();
    }
  }


}
