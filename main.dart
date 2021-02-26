

import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'newdata.dart';
import 'details.dart';


void main() => runApp(MaterialApp(
  title: "Flutter Mysql",
  debugShowCheckedModeBanner: false,
  theme: ThemeData(
    primarySwatch: Colors.red,
  ),
  home: Home(),
));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
   Future<List> getData() async {
     final res= await http.get("http://jmzxp.com/flutter_app_01/dbselectall.php");
     //print(json.decode(res.body));
     return json.decode(res.body);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Mysql : Select All"),
        backgroundColor: Colors.blueAccent,
      ),

     floatingActionButton: FloatingActionButton(
       backgroundColor: Colors.blueAccent,
        onPressed: ()=>Navigator.of(context).push(
    MaterialPageRoute(
     builder: (BuildContext context)=> NewData(),
           )
        ),
        child: Icon(Icons.add),
      ),

      body: FutureBuilder<List>(
        future: getData(),
        builder:(ctx,ss) {
          if(ss.hasError){
            print("Error");
          }
          if (ss.hasData){
          return Items(list:ss.data);
          }else{
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}

class Items extends StatelessWidget {
  List list;
  Items({this.list});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list==null?0:list.length,
        itemBuilder: (ctx,i){
          return ListTile(

            leading: ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: 50,
                minHeight: 50,
                maxWidth: 50,
                maxHeight: 50,
              ),
            ),

              title: Text(list[i]['id']+" - "+list[i]['firstname']+" "+list[i]['lastname'],
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),

            onTap: ()=>Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context)=> Details(list:list,index:i),
              )
            )
          );
        }
    );
  }
}
