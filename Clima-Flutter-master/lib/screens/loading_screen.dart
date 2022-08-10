import 'dart:convert';

import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:flutter/material.dart';

const apikey = "6b55d24d3377d0c8617afe58f162c8c2";

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double longitude;
  double latitude;

  @override
  initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    Location location = Location();
    await location.getLocation();

    this.longitude = location.longitude;
    this.latitude = location.latitude;

    Uri url = Uri.https(
        "api.openweathermap.org",
        "/data/2.5/weather",
        ({"lat": latitude, "lon": longitude, "appid": apikey})
            .map((key, value) => MapEntry(key, value.toString())));

    NetworkHelper networkHelper = NetworkHelper(url: url);
    dynamic responseData = await networkHelper.getData();

    var temperature = responseData["main"]["temp"];
    var condition = responseData["weather"][0]["id"];
    var cityName = responseData["name"];

    print(temperature);
    print(condition);
    print(cityName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          onPressed: () {
          },
          child:
              Text('latitude: ${this.latitude}, longitude: ${this.longitude}'),
        ),
      ),
    );
  }
}
