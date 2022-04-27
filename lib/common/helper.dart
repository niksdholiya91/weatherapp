import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/service/pref_service.dart';
import 'package:weather_app/utils/asset_res.dart';
import 'package:weather_app/utils/pref_keys.dart';

Future<void> getCurrentLocation() async {
  LocationPermission permission = await Geolocator.checkPermission();

  if (permission == LocationPermission.denied) {
    await Geolocator.requestPermission();
    await getCurrentLocation();
  } else {
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    await PrefService.setValue(PrefKeys.latitude, position.latitude);
    await PrefService.setValue(PrefKeys.longitude, position.longitude);
    List<Placemark> placeMarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);

    await PrefService.setValue(PrefKeys.locality, placeMarks.first.locality);
  }
}

double celToFr(num c) {
  return c * 9 / 5 + 32;
}

double frToCel(num f) {
  return ((f - 32) * 5 / 9);
}

double kelToCel(num k) {
  return k - 273.15;
}

double celToKel(num c) {
  return c + 273.15;
}

String getImageFromWeather(String id) {
  if (id == "Clear") {
    return AssetRes.sunnyWeather;
  } else if (id == "Snow") {
    return AssetRes.cloudyWeather;
  } else if (id == "Rain") {
    return AssetRes.rainyWeather;
  } else {
    return AssetRes.cloudWeather;
  }
}

String getDateFormatFromMillS(String format, int mill) {
  int milliSecond = mill.toString().length == 13 ? mill : (mill * 1000);
  DateTime time = DateTime.fromMillisecondsSinceEpoch(milliSecond);

  return DateFormat(format).format(time);
}

bool isToday(int mill) {
  int milliSecond = mill.toString().length == 13 ? mill : (mill * 1000);
  DateTime time = DateTime.fromMillisecondsSinceEpoch(milliSecond);
  DateTime now = DateTime.now();

  return (time.day == now.day &&
      time.month == now.month &&
      time.year == now.year);
}
