

import 'package:flutter/material.dart';


// ignore: must_be_immutable
class Principal extends StatefulWidget{

  @override
  _PrincipalState createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  String email;

  String pass;

  final llave = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black54,
        title: Text('Travel App'),
      ),
      body: Padding(
          padding: EdgeInsets.all(40),
          child: SingleChildScrollView(
            child: Form(
              key: llave,
              child: Column(
                children:<Widget>[
                  TextFormField(
                    decoration: InputDecoration(labelText: 'E-mail'),
                    keyboardType: TextInputType.emailAddress,
                    onSaved: (value){
                      email = value;
                    },
                    validator: (value){
                      if(value.isEmpty){
                        return 'El campo no puede estar vacío';
                      }
                      else{
                        return null;
                      }

                    },
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(labelText: 'Password'),
                    validator: (value){
                      if(value.isEmpty){
                        return 'La contraseña no puede estar vacía';
                      }
                      else{
                        return null;
                      }
                    },
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: RaisedButton(
                      color: Colors.black54,
                      child: Text('Log in', style: TextStyle(color: Colors.white),),
                      onPressed: (){
                        setState(() {

                        });
                        _showSecondPage(context);
                      },
                    ),
                  )
                ],
              ),
            ),
          )
      ),
    );

  }


  void _showSecondPage(BuildContext context) {

    if(llave.currentState.validate()){

      Navigator.of(context).pushNamed("/second");
    }

  }
}
