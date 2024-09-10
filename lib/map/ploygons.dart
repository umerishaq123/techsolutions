import 'dart:async';
import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Polygons extends StatefulWidget {
  const Polygons({super.key});

  @override
  State<Polygons> createState() => _PolygonsState();
}

class _PolygonsState extends State<Polygons> {
  Completer<GoogleMapController> _completer = Completer();
  CameraPosition _kGooglePlex =
      CameraPosition(target: LatLng(34.465691, 73.254852), zoom: 13);
  Set<Polygon> _polygon = HashSet<Polygon>();
  final Set<Marker> _marker = {};
  List<LatLng> points = [
    LatLng(34.465691, 73.254852),
    LatLng(34.865038, 72.585762),
    LatLng(34.202710, 73.030433),
    LatLng(34.111013, 73.511887),
    LatLng(34.382214, 72.986516),
    LatLng(34.465691, 73.254852),
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _polygon.add(Polygon(polygonId: PolygonId('1'), 
    points: points,
    fillColor: Colors.yellow,
    strokeWidth: 10,
    strokeColor: Colors.red,
    geodesic: true
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('polyGons'),
      ),
      body: GoogleMap(
        initialCameraPosition: _kGooglePlex,
        mapType: MapType.normal,
        polygons: _polygon,
        onMapCreated: (GoogleMapController controller) {
          _completer.complete(controller);
          
        },
      ),
    );
  }
}
