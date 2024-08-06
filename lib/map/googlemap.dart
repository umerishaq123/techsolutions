import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Completer<GoogleMapController> _controller = Completer();
  CameraPosition _cameraPosition = CameraPosition(
      target: LatLng(
        34.19515228839519,
        73.23560811156557,
      ),
      zoom: 13);

  List<Marker> _marker = [];
  List<Marker> list = [
    Marker(
        markerId: MarkerId('1'),
        position: LatLng(
          34.19515228839519,
          73.23560811156557,
        ),
        infoWindow: InfoWindow(title: 'My current Location')),
    Marker(
        markerId: MarkerId('1'),
        position: LatLng(34.043480656330296, 73.1407105766653),
        infoWindow: InfoWindow(title: 'Fitness freek gym')),
  ];
  @override
  void initState() {
    // TODO: implement initState

    _marker.addAll(list);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GoogleMap(
          markers: Set<Marker>.of(_marker),
          mapType: MapType.normal,
          myLocationEnabled: true,
          compassEnabled: true,
          initialCameraPosition: _cameraPosition,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            GoogleMapController controller = await _controller.future;
            controller.animateCamera(CameraUpdate.newCameraPosition(
                CameraPosition(
                    target: LatLng(34.043480656330296, 73.1407105766653),
                    zoom: 14)));
          },
          child: Icon(Icons.location_disabled_rounded),
        ),
      ),
    );
  }
}
