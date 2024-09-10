import 'package:flutter/material.dart';

import 'package:geocoding/geocoding.dart';

class convertlatlantoadres extends StatefulWidget {
  const convertlatlantoadres({super.key});

  @override
  State<convertlatlantoadres> createState() => _convertlatlantoadresState();
}

class _convertlatlantoadresState extends State<convertlatlantoadres> {
  String setaddres='';
  String stdadd='';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('conversion'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(setaddres),
          Text(stdadd),
          GestureDetector(
              onTap: () async {
                ///////////////query conversion////////////////
                List<Location> locations =
                    await locationFromAddress("Gronausestraat 710, Enschede");
                     List<Placemark> placemarks =
                    await placemarkFromCoordinates(52.2165157, 6.9437819);

                setState(() {
                  setaddres = locations.last.longitude.toString()+""+locations.last.latitude.toString();
                  print("::: the address is :$setaddres");
                  stdadd=placemarks.reversed.last.locality.toString()+"" +placemarks.reversed.last.country.toString();
                  print(":::: $stdadd");
                });
//////////////////////////coordinate conversion///////////////////

              
              },
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      height: 40,
                      // width: 60,
                      decoration: BoxDecoration(color: Colors.green),
                      child: Center(child: Text('convert'))),
                ),
              )),
        ],
      ),
    );
  }
}
