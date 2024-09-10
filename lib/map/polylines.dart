import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Polylines extends StatefulWidget {
  const Polylines({super.key});

  @override
  State<Polylines> createState() => _PolylinesState();
}

class _PolylinesState extends State<Polylines> {
  Completer<GoogleMapController> _completer = Completer();
  CameraPosition _cameraPosition =
      CameraPosition(target: LatLng(34.465691, 73.254852), zoom: 13);
  final Set<Polyline> _polylines = {};
  final Set<Marker> _marker={};
  List<LatLng> points = [
    LatLng(34.212732, 73.243464),
    LatLng(34.208994, 73.234752),
    LatLng(34.204779, 73.227108),
    LatLng(34.194209, 73.229327),
    LatLng(34.191693, 73.229944),
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  for(var i=0; i<points.length;i++){
    _marker.add(Marker(markerId: MarkerId(i.toString()),position:points[i] ,
    infoWindow: InfoWindow(title: 'whats a cool place '),
    icon: BitmapDescriptor.defaultMarker),
    
    );
    
  
  setState(() {
      
    });

  }
  _polylines.add(Polyline(polylineId: PolylineId('1'),points: points,color: Colors.red));
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PolyLines'),
      ),
      body: GoogleMap(
        initialCameraPosition: _cameraPosition,
        mapType: MapType.normal,
        onMapCreated: (GoogleMapController controller) {
          _completer.complete(controller);
        },
        polylines: _polylines,
        markers: _marker,
      ),
    );
  }
}
