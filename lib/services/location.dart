import 'package:geolocator/geolocator.dart';

class Location{
  double latitude;
  double longitude;

  Future<void> getCurrentLocation() async {
    Geolocator geoLocator = Geolocator();
    try{
      Position position = await geoLocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      latitude = position.latitude;
      longitude = position.longitude;
    }catch(e){
      print(e);
    }
  }
}