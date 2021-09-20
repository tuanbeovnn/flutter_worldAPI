import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  late String location;
  late String time;
  late String flag;
  late String url;
  late bool isDayTime;

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {
    try {
      final response = await http
          .get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);

      // get properties

      String dateTime = data["datetime"];
      String offset = data["utc_offset"];

      // create datetime object

      DateTime now = DateTime.parse(dateTime);
      now = now.add(Duration(hours: int.parse(offset.substring(1, 3))));
      // set the time
      isDayTime = now.hour > 6 && now.hour < 20 ? true : false;
      time = DateFormat.jm().format(now);
    } catch (e) {
      print("Error: $e");
      time = "Could not get time data";
    }
  }
}
