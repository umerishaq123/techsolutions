import 'package:flutter/material.dart';
import 'package:flutter_geocoder/geocoder.dart';

class convertlatlantoadres extends StatefulWidget {
  const convertlatlantoadres({super.key});

  @override
  State<convertlatlantoadres> createState() => _convertlatlantoadresState();
}

class _convertlatlantoadresState extends State<convertlatlantoadres> {
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
          GestureDetector(
              onTap: () async {
                ///////////////query conversion////////////////
                final query = "1600 Amphiteatre Parkway, Mountain View";
                var addresses =
                    await Geocoder.local.findAddressesFromQuery(query);
                var first = addresses.first;
                print("${first.featureName} : ${first.coordinates}");


//////////////////////////coordinate conversion///////////////////
                final coordinates = new Coordinates(1.10, 45.50);
                var addresse = await Geocoder.local
                    .findAddressesFromCoordinates(coordinates);
                var second = addresse.first;
                print("${second.featureName} : ${second.addressLine}");
              },
              child: Center(
                child: Container(
                    height: 40,
                    // width: 60,
                    decoration: BoxDecoration(color: Colors.green),
                    child: Center(child: Text('convert'))),
              )),
        ],
      ),
    );
  }
}
