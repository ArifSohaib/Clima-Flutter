import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

class WeatherModel {
  String api= "6945aa8cd21430e17a3772e11f4e3bc0";
  String openWeatherMapUrl = 'https://api.openweathermap.org/data/2.5/weather';
  String openWeatherMapUrlFixed = 'https://api.openweathermap.org/data/2.5/weather?q=Ann%20Arbor&appid=6945aa8cd21430e17a3772e11f4e3bc0&units=imperial';
  Future<dynamic> getCityWeather(String city) async{
//    NetworkHelper networkHelper = NetworkHelper(url: '$openWeatherMapUrl?q=$city&appid=$api&units=imperial');
    NetworkHelper networkHelper = NetworkHelper(url: '$openWeatherMapUrl?q=$city&appid=$api&units=metric');
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async{
    Location location = Location();
    await location.getCurrentLocation();

    NetworkHelper  networkHelper = NetworkHelper(url:'$openWeatherMapUrl?&lat=${location.latitude}&lon=${location.longitude}&appid=$api&units=metric');
    var weatherData = await networkHelper.getData();
    return weatherData;

  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
