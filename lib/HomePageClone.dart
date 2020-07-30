import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';

class HomePageClone extends StatefulWidget {
  @override
  _HomePageCloneState createState() => _HomePageCloneState();
}

class _HomePageCloneState extends State<HomePageClone> {
  List data;

  Future<String> getData() async {
    http.Response response = await http.get(
        Uri.encodeFull("https://jsonplaceholder.typicode.com/posts"),
        headers: {"Accept": "application/json"});
    setState(() {
      data = json.decode(response.body);
    });
    return "Success!";
  }

  @override
  // ignore: must_call_super
  void initState() {
    this.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List Quotes"),
        backgroundColor: Colors.blueAccent,
      ),
      body: ListView.builder(
          itemCount: data.length,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              child: Card(
                child: Text(data[index]["body"].toString()),
              ),
            );
          }),
    );
  }
}
