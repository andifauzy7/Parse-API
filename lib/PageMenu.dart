import 'package:flutter/material.dart';
import 'package:get_api/HomePageClone.dart';
import 'package:get_api/home.dart';

class PageMenu extends StatefulWidget {
  @override
  _PageMenuState createState() => _PageMenuState();
}

class _PageMenuState extends State<PageMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Menu"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Container(
          child: Column(
            children: <Widget>[
              RaisedButton(
                child: Text("User API"),
                color: Colors.blue[100],
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                },
              ),
              RaisedButton(
                child: Text("Quotes API"),
                color: Colors.blue[100],
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => HomePageClone()));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
