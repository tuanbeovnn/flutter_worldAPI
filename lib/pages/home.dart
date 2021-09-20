import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty
        ? data
        : ModalRoute.of(context)!.settings.arguments as Map;
    print(data);

    //set backgournd
    String bgImage = data['isDayTime'] ? 'day.png' : 'night.png';
    Color backGroundColor = data["isDayTime"] ? Colors.blue : Colors.indigo;

    return Scaffold(
      backgroundColor: backGroundColor,
      body: SafeArea(
          child: Container(
        // decoration: BoxDecoration(
        //     image: DecorationImage(
        //         image: AssetImage('assets/$bgImage'), fit: BoxFit.cover)),
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, 120, 0, 0),
          child: Column(
            children: [
              TextButton.icon(
                  onPressed: () async {
                    dynamic result =
                        await Navigator.pushNamed(context, "/location");
                    setState(() {
                      data = {
                        'time': result['time'],
                        'location': result['location'],
                        'isDayTime': result['isDayTime'],
                        'flag': result['flag'],
                      };
                    });
                  },
                  icon: Icon(
                    Icons.edit_location,
                    color: Colors.amber,
                    size: 50,
                  ),
                  label: Text(
                    "Edit Location",
                    style: TextStyle(fontSize: 20),
                  )),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    data['location'],
                    style: TextStyle(fontSize: 30, letterSpacing: 2),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                data['time'],
                style: TextStyle(fontSize: 70, letterSpacing: 2),
              )
            ],
          ),
        ),
      )),
    );
  }
}
