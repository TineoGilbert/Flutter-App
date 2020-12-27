
import 'package:flutter/material.dart';
import 'package:travelapp1/pages/history.dart';
import 'package:travelapp1/pages/map.dart';
import 'package:travelapp1/pages/profile.dart';

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> with SingleTickerProviderStateMixin {
  TabController tabController;


  @override
  void initState() {
    tabController = new TabController(length: myPages.length, vsync: this);
    tabController.addListener(() {
      setState(() {
        print("index ${tabController.index}");
      });
    });
    super.initState();
  }


  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  List<Tab> myPages = <Tab>[
    new Tab(icon: Icon(Icons.history), text: 'HISTORY'),
    new Tab(icon: Icon(Icons.map), text: 'MAP'),
    new Tab(icon: Icon(Icons.account_circle), text: 'PROFILE')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black54,
        title: Text('Travel App', style: TextStyle(fontWeight: FontWeight.bold)),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.add_circle_outline),
              onPressed: (){
                addPage(context);
              })
        ],
        bottom: new TabBar(
          tabs: myPages, controller: tabController,
        ),

      ),
      body: new TabBarView(children: [
        new History(),
        new MyMap(),
        new Profile()
      ],
          controller: tabController),
    );
  }

  void addPage(BuildContext context) {
    Navigator.of(context).pushNamed('/third');
  }
}
