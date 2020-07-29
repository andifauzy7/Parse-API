import 'package:flutter/material.dart';
import 'package:get_api/details.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State {

  List data;

  Future<String> getData() async{
    http.Response response = await http.get(
        Uri.encodeFull("http://api.bengkelrobot.net:8001/api/profile"),
        headers: {
          "Accept":"application/json"
        }
    );
    setState((){
      data = json.decode(response.body);
    });
    return "Success!";
  }

  @override
  // ignore: must_call_super
  void initState(){
    this.getData();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        leading: Icon(Icons.verified_user),
        title: new Text("List User"),
        backgroundColor: Colors.blueAccent,
      ),
      body: new ListView.builder(
        itemCount: data == null ? 0 : data.length,
        itemBuilder: (BuildContext context, int index){
          return InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => Detail()));
            },
            child: new Card(
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          backgroundImage: NetworkImage("https://png.pngtree.com/png-vector/20190321/ourmid/pngtree-vector-users-icon-png-image_856952.jpg"),
                          backgroundColor: Colors.transparent,
                          radius: 40.0,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("ID : " + data[index]["id"].toString()),
                          Text("Username : " + data[index]["name"]),
                          Text("Email : " + data[index]["email"]),
                          Text("Age : " + data[index]["age"].toString()),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

}