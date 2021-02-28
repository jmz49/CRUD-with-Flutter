
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
    primaryColor: Colors.purpleAccent
  ),
  home: Home(),
));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
   Future<List> getAllData() async {
     final temp= await http.get("http://jmzxp.com/flutter_app_01/dbselectall.php");
     final res= await http.get("http://jmzxp.com/flutter_app_01/dbselectall.php");
     return json.decode(res.body);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Mysql : Select All"),
        backgroundColor: Color.fromRGBO(109, 14, 55, 1.0),
      ),

     floatingActionButton: FloatingActionButton(
       backgroundColor: Color.fromRGBO(109, 14, 55, 1.0),
        onPressed: ()=>Navigator.of(context).push(
    MaterialPageRoute(
     builder: (BuildContext context)=> NewData(),
           )
        ),
        child: Icon(Icons.add),
      ),

      body: FutureBuilder<List>(
        future: getAllData(),
        builder:(ctx,snapshot) {
          if(snapshot.hasError){
            print("Error");
          }
          if (snapshot.hasData){
          return Items(list:snapshot.data);
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
                minWidth: 0.0,
                minHeight: 0.0,
                maxWidth: double.infinity,
                maxHeight: double.infinity,
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


