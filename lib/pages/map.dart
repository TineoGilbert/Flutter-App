

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MyMap extends StatefulWidget {
  @override
  _MyMapState createState() => _MyMapState();
}

class _MyMapState extends State<MyMap> {

  LatLng _initialPosition = LatLng(19.0000000, -70.6667000);
  GoogleMapController _controller;
  Location _location = Location();
  Set<Marker> miMarcador;
  MapType type;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    miMarcador = Set.from([]);
    type = MapType.hybrid;
  }

  void _onMapCreated(GoogleMapController _cntrl) {
    _controller = _cntrl;
    _location.onLocationChanged().listen((l) {
      _controller.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
              target: LatLng(l.latitude, l.longitude),
              zoom: 17
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          GoogleMap(
            markers: miMarcador,
            mapType: type,
            onTap: (position){
              Marker mk1 = Marker(
                markerId: MarkerId('1'),
                position: position
              );
              setState(() {
                miMarcador.add(mk1);
              });
            },
            initialCameraPosition:
            CameraPosition(target: _initialPosition, zoom: 23),
           // mapType: MapType.normal,
            onMapCreated: _onMapCreated,
            myLocationEnabled: true,
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Row(
              children: <Widget>[
                FloatingActionButton(onPressed: (){
                  setState(() {
                    type = type == MapType.hybrid? MapType.normal: MapType.hybrid;
                  });
                  
                },
                child: Icon(Icons.map),)
              ],
            ),
          )
        ],
      ),

    );
  }
}
