import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../worker/worker.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  Worker instance = Worker("Bhopal");
//calling a worker class here

  late String temp;
  late String city = "Bhopal";

  late String humidity;
  late String air_speed;
  late String discription;
  late String main;
  late String icon;
  void startApp(String city) async {
    Worker instance = Worker("$city");
    await instance.getData();

    temp = instance.temp;
    humidity = instance.humidity;
    air_speed = instance.air_speed;
    discription = instance.discription;
    main = instance.main;
    icon = instance.icon;

    // Throw data this screen to home screen
    Navigator.pushReplacementNamed(context, "/home", arguments: {
      "temp_value": temp,
      "hum_value": humidity,
      "air_speed_value": air_speed,
      "dis_value": discription,
      "main_value": main,
      "icon_value": icon,
      "city_value": city
    });
  }

  void initState() {
    super.initState();
  }

  // Ui work

  @override
  Widget build(BuildContext context) {
    // set funtionality  of Search City name and set City name
    Map search = ModalRoute.of(context)!.settings.arguments as Map;
     if (search?.isNotEmpty ?? false) {
    city = search['searchText'];
    }
    startApp(city);

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 110,
              ),
              Image.asset("images/mlogoo.png"),
              SizedBox(
                height: 50,
              ),
              Text(
                "Weather App",
                style: TextStyle(fontSize: 40, color: Colors.white),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Created by Virendra ",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                    color: Colors.white),
              ),
              SizedBox(height: 20),
              SpinKitWave(
                color: Colors.grey,
                size: 100.0,
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.blue,
    );
  }
}
