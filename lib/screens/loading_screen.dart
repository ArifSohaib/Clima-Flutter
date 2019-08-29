import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:clima/screens/location_screen.dart';
import 'package:clima/services/weather.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  Location location;
  double latitude=42.241150;
  double longitude=-83.612991;
  String api= "6945aa8cd21430e17a3772e11f4e3bc0";

  void getLocationData() async{
    var weatherData = await WeatherModel().getLocationWeather();
    Navigator.push(context, MaterialPageRoute(builder: (context)=>LocationScreen(locationWeather: weatherData,)));
  }

  @override
  void initState() {
    getLocationData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: SpinKitChasingDots(size: 100,color: Colors.white,),
        ),
      )

    );
  }
}

//      double temperature = decodedData["main"]["temp"];
//      int condition = decodedData["weather"][0]["id"];
//      String city = decodedData["name"];