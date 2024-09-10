import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:http/http.dart' as http;

class GooglePlaces extends StatefulWidget {
  const GooglePlaces({super.key});

  @override
  State<GooglePlaces> createState() => _GooglePlacesState();
}

class _GooglePlacesState extends State<GooglePlaces> {
  TextEditingController _searchController=TextEditingController();
  var uuid=Uuid();
  String _sessionToken="12345";
  List<dynamic>  placeslist=[];
  @override
  void initState() {
    // TODO: implement initState
    
    _searchController.addListener((){
onchanged();
    });
  }
  void onchanged(){
if(_sessionToken != null){
  setState(() {
    _sessionToken==uuid.v4();
  });
  getsuggestion (_searchController.text);
}

  }
  void getsuggestion(String input)async{
    String kPLACES_API_KEY='AIzaSyAAKeK9N9yGIZhEo8BDNjIciDTwXqiwl28';
 
String baseURL ='https://maps.googleapis.com/maps/api/place/autocomplete/json';
      String request = '$baseURL?input=$input&key=$kPLACES_API_KEY&sessiontoken=$_sessionToken';
      final response=await http.get(Uri.parse(request));
      print("::: the repsnse of api is :${response.body.toString()}");
      if(response.statusCode==200){
setState(() {
  placeslist=jsonDecode(response.body.toString()) ['predictions'];
});
      }else{
        throw Exception('failed to load data');
      }


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Places'),
        centerTitle: true,
      ),
      body: 
      Column(
        children: [
          TextFormField(
            controller: _searchController,

          ),
          Expanded(child: 
          ListView.builder(
            itemCount: placeslist.length,
            itemBuilder:(context,index){
              return ListTile(
                title: Text(placeslist[index]['description']),
              );

            } )
          )
        ],
      ),
    );
  }
}




