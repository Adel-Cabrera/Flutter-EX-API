import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map data;
  List userData;

  Future getData() async {
    http.Response response =
        await http.get("https://reqres.in/api/users?page=2");
    // debugPrint(response.body);
    print(response.statusCode);
//    print(response.runtimeType);
    // print(response.statusCode.runtimeType); => es un int
//    print(response.body); => es un string
//    print(response.body.runtimeType);
    data = json.decode(response.body);
    // print(data);
    // print(data.runtimeType); => es un _InternalLinkedHashMap
    setState(() {
      userData = data["data"];
    });
    // debugPrint(userData.toString());
    // print(userData.runtimeType); => es una lista
    // print(userData.toString().runtimeType); => es un string
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Fake friends',
        ),
      ),
      body: ListView.builder(
        itemCount: userData == null ? 0 : userData.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: Padding(
              padding: EdgeInsets.all(
                10.0,
              ),
              child: Row(
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                      userData[index]["avatar"],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(
                      10.0,
                    ),
                    child: Text(
                      "${userData[index]["first_name"]} ${userData[index]["last_name"]}",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
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
