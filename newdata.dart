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

  void insertData() async {
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
        backgroundColor: Color.fromRGBO(109, 14, 55, 1.0),
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
                          hintStyle: TextStyle(color: Color.fromRGBO(109, 14, 55, 1.0)),
                          labelText: "Prénom",
                          labelStyle: TextStyle(color: Color.fromRGBO(109, 14, 55, 1.0)),
                          ),
                      ),
                      TextField(
                        controller: lastname,
                        decoration: InputDecoration(
                           hintText: "Nom",
                          hintStyle: TextStyle(color: Color.fromRGBO(109, 14, 55, 1.0)),
                          labelText: "Nom",
                          labelStyle: TextStyle(color: Color.fromRGBO(109, 14, 55, 1.0)),
                          ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      MaterialButton(
                        child: 
                          Text("Save",
                            style: TextStyle(fontSize:  18.0, fontWeight: FontWeight.bold, color : Colors.white),
                          ),
                          color: Color.fromRGBO(109, 14, 55, 1.0),
                        onPressed: () {
                          insertData();
                          Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (BuildContext context)=> Home(),
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
