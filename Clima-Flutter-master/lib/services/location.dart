import 'package:geolocator/geolocator.dart';

class Location {
  double longitude;
  double latitude;

  Future<void> getLocation() async {
    LocationPermission checkedPermission = await Geolocator.checkPermission();
    if (checkedPermission.index == 0 || checkedPermission.name == "denied") {
      await Geolocator.requestPermission();
    }

    try {
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);

      this.longitude = position.longitude;
      this.latitude = position.latitude;
      print(position);
    } catch (e) {
      print(e);
    }
  }
}