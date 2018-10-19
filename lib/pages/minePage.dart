import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class mineScreen extends StatefulWidget {
  @override
  _mineScreenState createState() => _mineScreenState();
}

class _mineScreenState extends State<mineScreen> {

  List<String> images;
  ScrollController _controller;

  @override
  void initState(){
    super.initState();
    images = List();
    _controller = ScrollController();
    fetchTen();
    _controller.addListener((){
      if(_controller.position.pixels == _controller.position.maxScrollExtent){
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
        title: Text('lalalwoshi'),
      ),
      body: ListView.builder(
          controller: _controller,
          itemCount: images.length,
          itemBuilder: (BuildContext context,int index){
            return Container(
              child:
              Image.network(images[index],
                fit: BoxFit.cover,
              ),
            );
          }
      ),
    );
  }


  fetch() async{

    final response = await http.get('http://dog.ceo/api/breeds/image/random');
    if(response.statusCode == 200){
      setState(() {
        images.add(json.decode(response.body)['message']);
      });
    }else{
      throw Exception('失败图片');
    }
  }


  fetchTen(){
    for(int i =0 ; i< 10; i ++){
      fetch();
    }
  }


}

