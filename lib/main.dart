import 'package:flutter/material.dart';
import 'package:tech/map/convert_coordiante_to_location.dart';
import 'package:tech/map/googlemap.dart';

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
      home: const convertlatlantoadres(),
    );
  }
}

/////new repo
///////////////////////////////////////////////
//////////////////////heelo hare
//////////////////////hlo
///

