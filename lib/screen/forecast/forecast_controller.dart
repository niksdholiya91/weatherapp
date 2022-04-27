import 'package:get/get.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/screen/forecast/api/forecast_api.dart';

class ForecastController extends GetxController {
  WeatherModel forecast = WeatherModel();
  RxBool loader = false.obs;
  int selectedTimeSlot = 0;

  Future<void> init() async {
    await getForecastData();
  }

  Future<void> getForecastData() async {
    loader.value = true;
    forecast = (await ForecastApi.getForecastData()) ?? WeatherModel();
    loader.value = false;
  }

  void onTimeSelect(int index) {
    selectedTimeSlot = index;
    update(['today_weather']);
  }
}
