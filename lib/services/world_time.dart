import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class WorldTime {

  String location;
  late String time;
  String flag;
  String url;

  WorldTime({required this.location,required this.flag,required this.url});

  Future<void> getTime() async {
    // make the request
    Response responseTime = await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
    Map data = jsonDecode(responseTime.body);
    //print(data);

    //get properties from data
    String dateTime = data['datetime'];
    String offset = data['utc_offset'].substring(1,3);

    // create DateTime object
    DateTime now = DateTime.parse(dateTime);
    now = now.add(Duration(hours: int.parse(offset)));

    //set the time property
   time = now.toString();

  }

}

