import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';


class secondPageScreen extends StatefulWidget {
  @override
  _secondPageScreenState createState() => _secondPageScreenState();
}

class _secondPageScreenState extends State<secondPageScreen> {
  List<String> images;
  ScrollController _controller;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    _controller.dispose();
  }

  @override
  void initState(){
    super.initState();
    images = List<String> ();
    _controller = ScrollController();
    //拉取数据
    if(images.length == 0){
      fethten();
    }
    _controller.addListener((){
      if(_controller.position.pixels == _controller.position.maxScrollExtent){
        fethten();
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('dierge'),
      ),
      body: RefreshIndicator(
          child: ListView.builder(
              controller: _controller,
              itemCount: images.length,
              itemBuilder: (BuildContext context,int index){
                return Container(
                  child: Image.network(
                    images[index],
                    fit: BoxFit.cover,
                  ),
                );
              }
          ),
          onRefresh: () async {
            await new Future.delayed(const Duration(seconds: 1));
            images.clear();
            fethten();
          }
      ),
    );
  }

  fetch () async {
    final response = await http.get('http://dog.ceo/api/breeds/image/random');
    if(response.statusCode == 200){
      setState(() {
        images.add(json.decode(response.body)['message']);
      });
    }else{
      throw Exception('加载图片失败哦');

    }
  }


  fethten(){
    for(int i = 0; i < 10; i ++){
      fetch();
    }
  }

}

