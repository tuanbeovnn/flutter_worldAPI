import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:quotes/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  // void getDate() async {
  //   // Response response =http.get('https://jsonplaceholder.typicode.com/todos/1');
  //   // print(response.body);

  //   final response = await http
  //       .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));

  //   if (response.statusCode == 200) {
  //     // If the server did return a 200 OK response,
  //     // then parse the JSON.
  //     Map data = jsonDecode(response.body);
  //     print(data);
  //     print(data["title"]);
  //     return jsonDecode(response.body);
  //   } else {
  //     // If the server did not return a 200 OK response,
  //     // then throw an exception.
  //     throw Exception('Failed to load album');
  //   }
  // }
  String time = 'loading';
  void setUpWorldTime() async {
    WorldTime instance = WorldTime(
        location: "Berlin", flag: "germany.png", url: "Europe/Helsinki");
    await instance.getTime();
    Navigator.pushReplacementNamed(context, "/home", arguments: {
      "location": instance.location,
      "flag": instance.flag,
      "time": instance.time,
      "isDayTime": instance.isDayTime
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setUpWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Center(
        child: SpinKitFadingCircle(
          color: Colors.white,
          size: 80,
        ),
      ),
    );
  }
}
