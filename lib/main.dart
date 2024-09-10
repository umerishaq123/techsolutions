import 'package:flutter/material.dart';
import 'package:tech/map/convert_coordiante_to_location.dart';
import 'package:tech/map/google_places.dart';
import 'package:tech/map/googlemap.dart';
import 'package:tech/map/ploygons.dart';
import 'package:tech/map/polylines.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
      
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Polylines(),
    );
  }
}

/////new repo
///////////////////////////////////////////////
//////////////////////heelo hare
//////////////////////hlo
///

