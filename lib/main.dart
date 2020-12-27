
import 'package:flutter/material.dart';
import 'package:travelapp1/pages/add.dart';
import 'package:travelapp1/pages/history.dart';
import 'package:travelapp1/pages/principal.dart';
import 'package:travelapp1/pages/secondpage.dart';

void main() => runApp(TravelApp());

class TravelApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //home: Principal(),
      initialRoute: "/",
      routes: {
        "/":(BuildContext context) => Principal(),
        "/second":(BuildContext context) => SecondPage(),
        "/third":(BuildContext context) => Add(),
        "/experience":(BuildContext context) => History()
      },
    );

  }
}

