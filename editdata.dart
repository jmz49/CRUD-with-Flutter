
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'main.dart';


class EditData extends StatefulWidget {
  List list;
  int index;
  EditData({this.list, this.index});
  @override
  _EditDataState createState() => _EditDataState();
}

class _EditDataState extends State<EditData> {

  TextEditingController firstname;
  TextEditingController lastname;
  // final GlobalKey<ScaffoldState> _scaffoldstate = new GlobalKey<ScaffoldState>();

  void updateData() async {
    try {
      FormData formData = FormData.fromMap({
        'id':widget.list[widget.index]['id'],
        "firstname":firstname.text,
        "lastname":lastname.text,
      });

      //Response response = await
      Dio().post("http://jmzxp.com/flutter_app_01/dbupdate.php", data: formData);
      //print("File upload response: $response");
    } catch (e) {
      print("Exception caught: $e");
    }
  }

  @override
  void initState(){
    firstname=TextEditingController(text: widget.list[widget.index]['firstname']);
    lastname=TextEditingController(text: widget.list[widget.index]['lastname']);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //title: Text("modifier ${widget.list[widget.index]['name']}"),
        title: Text("Flutter Mysql : Update"),
        backgroundColor: Color.fromRGBO(109, 14, 55, 1.0),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            child: Column(
              children: [
                SizedBox(height: 50,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal:16),
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
                          hintText: "Prénom",
                          hintStyle: TextStyle(color: Colors.blueAccent),
                          labelText: "Prénom",
                          labelStyle: TextStyle(color: Colors.blueAccent),
                          ),
                      ),
                      SizedBox(height: 50,
                      ),
                      MaterialButton(
                        child: Text("Update",
                          style: TextStyle(fontSize:  18.0, fontWeight: FontWeight.bold, color : Colors.white),
                          ),
                          color: Color.fromRGBO(109, 14, 55, 1.0),
                        onPressed: (){
                          updateData();
                          Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (BuildContext context)=> Home(),
                              )
                          );
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
