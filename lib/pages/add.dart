
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travelapp1/pages/experience.dart';



class Add extends StatefulWidget {


  @override
  _AddState createState() => _AddState();
}

class _AddState extends State<Add> {

  final myKey = GlobalKey<FormState>();
  Map<String, dynamic> nuevaExpe = {};

  //String experience;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black54,
          actions: <Widget>[
            FlatButton(
                child: Text('Save', style: TextStyle(color: Colors.white),),
                onPressed: (){
                  myKey.currentState.save();
                  Experiencias().agregarExperiencias(nuevaExpe);
                  mostrarAlerta(context);
                  // Navigator.of(context).pushNamed('/experience');
                })
          ],
        ),
        body: Padding(
          padding: EdgeInsets.all(5),
          child: Form(
              key: myKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(hintText: 'Add your Experience'),
                    validator: (value){
                      if(value.isEmpty){
                        return 'El campo no puede estar vació';
                      }
                      else{
                        return null;
                      }
                    },
                    onSaved: (value){
                      nuevaExpe['ex'] = value;

                    },

                  )
                ],
              )),)
    );
  }

  void myExperience(BuildContext context) {
    myKey.currentState.save();
    Navigator.of(context).pushNamed('/experience');

  }

  void mostrarAlerta(BuildContext context){
    showDialog( context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title: Text('Su Experiencia ha sido agregada!'),
            actions: <Widget>[
              FlatButton(onPressed: (){
                Navigator.pop(context);
              },
                  child: Icon(Icons.check_circle_outline, color: Colors.green,))

            ],
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
          );
        });
  }
}
