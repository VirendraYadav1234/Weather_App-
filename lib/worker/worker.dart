import 'dart:convert';
import 'package:http/http.dart';

class Worker {
  late String location;
// constructor
  Worker(this.location) {
    location = this.location;
  }
  late String temp;
  late String icon;
  late String humidity;
  late String air_speed;
  late String discription;
  late String main;

  // method
// Api use here
  Future<void> getData() async {
    try {
      Response response = await get(
          "https://api.openweathermap.org/data/2.5/weather?q=$location&appid=9427e8e841011249c5bff7703db1252c");
      Map data = jsonDecode(response.body);

      // Getting humidity and temp. humidity
      Map temp_data = data['main'];

      String get_humadity = temp_data['humidity'].toString(); //%
      double get_temp = temp_data['temp'] -
          273.15; // we take temp in kalvin and convert to degree celcius

      //Getting air speed
      Map wind = data['wind'];
      double get_air_speed =
          wind['speed'] / 0.2777777777777778; // convert metre/sec to km/hours

      // Getting Description

      List weather_data = data['weather'];
      Map weather_main_data = weather_data[0];
      String get_main_des = weather_main_data['main'];
      String get_desc = weather_main_data['description'];
      String get_icon = weather_main_data['icon'].toString();

      //assiging values
      temp = get_temp.toString();
      humidity = get_humadity;
      air_speed = get_air_speed.toString();
      discription = get_desc;
      icon = get_icon;
      main = get_main_des;
    } catch (e) {
      temp = "NA";
      humidity = "NA";
      air_speed = "NA";
      discription = "NA";
      main = "NA";
      icon = "03n";
    }
  }
}
