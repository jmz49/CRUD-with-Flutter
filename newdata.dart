import 'package:flutter/material.dart';
import 'main.dart';
import 'package:dio/dio.dart';

class NewData extends StatefulWidget {
  @override
  _NewDataState createState() => _NewDataState();
}

class _NewDataState extends State<NewData> {
  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  //final GlobalKey<ScaffoldState> _scaffoldstate =
      //new GlobalKey<ScaffoldState>();

  String titre, desc;

  void dbSelectAllData() async {
      FormData formData = new FormData.fromMap({
        "firstname": firstname.text,
        "lastname": lastname.text,
      });
      Dio().post("http://jmzxp.com/flutter_app_01/dbinsert.php", data: formData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Mysql : Insert"),
        backgroundColor: Colors.blueAccent,
      ),
      body: ListView(
        children: <Widget>[
          Container(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: <Widget>[
                      TextField(
                        controller: firstname,
                        decoration: InputDecoration(
                          hintText: "Prénom",
                          hintStyle: TextStyle(color: Colors.blueAccent),
                          labelText: "Prénom",
                          labelStyle: TextStyle(color: Colors.blueAccent),
                          ),
                      ),
                      TextField(
                        controller: lastname,
                        decoration: InputDecoration(
                           hintText: "Nom",
                          hintStyle: TextStyle(color: Colors.blueAccent),
                          labelText: "Nom",
                          labelStyle: TextStyle(color: Colors.blueAccent),
                          ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      MaterialButton(
                        child: 
                          Text("Save",
                          style: TextStyle(color : Colors.white),
                          ),
                          color: Colors.blueAccent,
                        onPressed: () {
                          dbSelectAllData();
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) => Home(),
                          ));
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
