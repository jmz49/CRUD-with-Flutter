import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'editdata.dart';
import 'main.dart';

class Details extends StatefulWidget {
  List list;
  int index;

  Details({this.list, this.index});

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {

  void delete() {
    var url = "http://jmzxp.com/flutter_app_01/dbdelete.php";
    http.post(url, body: {
      'id': widget.list[widget.index]['id'],
    });
  }

  @override
  Widget build(BuildContext context) {
    var status = 200;
    GlobalKey sc = new GlobalKey<ScaffoldState>();
    void confirm() {
      AlertDialog alertDialog = new AlertDialog(
        backgroundColor: Color.fromRGBO(250, 217, 151, 1.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
        content: Text("ETES VOUS SÛR ?",
        style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color : Colors.blueAccent),
        ),
        actions: <Widget>[
          Row(
            children: <Widget>[
              MaterialButton(
                child: Text("SUPPRIMER",
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color : Color.fromRGBO(195, 25, 99, 1.0),
                ),
                ),
                onPressed: () {
                  delete();
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => Home(),
                  ));
                },
              ),
              MaterialButton(
                child: Text("Annuler"),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => Home(),
                  ));
                },
              ),
            ],
          ),
        ],
      );
      showDialog(context: context, child: alertDialog);
    }

    return Scaffold(
      appBar: AppBar(
        //title: Text("${widget.list[widget.index]['name']}"),
        title: Text("Flutter Mysql : Update / Delete"),
        backgroundColor: Color.fromRGBO(109, 14, 55, 1.0),
      ),
      key: sc,
      body: status == 200
          ? ListView(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      child: Center(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 80,
                            ),
                            Text(
                              "${widget.list[widget.index]['firstname']}",
                              style: TextStyle(fontSize: 20.0),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "${widget.list[widget.index]['lastname']}",
                              style: TextStyle(fontSize: 14.0),
                            ),
                            SizedBox(
                              height: 50,
                            ),
                            MaterialButton(
                              child: Text("Edit",
                              style: TextStyle(fontSize:  16.0, fontWeight: FontWeight.bold, color : Colors.white),
                              ),
                              color: Color.fromRGBO(109, 14, 55, 1.0),
                              onPressed: ()=>Navigator.of(context).push(
                                  MaterialPageRoute(
                                   builder: (BuildContext context)=> EditData(list:widget.list,index:widget.index),
                                  )
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            MaterialButton(
                                child: Text("Delete",
                              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color : Colors.white),
                              ),
                              color: Color.fromRGBO(109, 14, 55, 1.0),
                                onPressed: () {
                                  confirm();
                                }),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
