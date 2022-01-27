import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:flutter_worl_time/services/world_time.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void getData() async {
    Response response =
        await get(Uri.http('jsonplaceholder.typicode.com', '/todos/1'));
    Map data = jsonDecode(response.body);
    print(data['title']);
  }

  String time = 'loading';

  void setUpWorldTime() async {
    WorldTime instance = WorldTime(
        location: 'Berlin', flag: 'germany.png', url: 'Europe/Berlin');
    await instance.getTime();
    // Navigator.pushNamed(context, '/');
    Navigator.pushReplacementNamed(context, '/home',arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time':instance.time,
    }

    );
     print(instance.time);
    // setState(() {
    //   time = instance.time;
    //}
    //);
  }

  @override
  void initState() {
    super.initState();
    setUpWorldTime();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: Padding(
      padding: EdgeInsets.all(50.0),
      child: Text('$time'),
    ));
  }
}
