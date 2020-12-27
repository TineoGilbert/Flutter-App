
import 'package:flutter/material.dart';

import 'experience.dart';



class History extends StatefulWidget {



  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: (Experiencias().misExperiencias.isNotEmpty)?ListView(
          children: _listado(),
        ): Center(
          child: Text('No tienes Experiencias Agregadas'),
        )
    );
  }


  List<Widget> _listado(){
    List<Widget> temporal = [];

    for(Map<String, dynamic> e in Experiencias().misExperiencias){
      Widget item = ListTile(
        title: Text("${e['ex']}"),
      );
      temporal.add(item);
    }
    return temporal;
  }
}