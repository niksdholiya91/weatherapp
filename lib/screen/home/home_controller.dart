import 'package:get/get.dart';
import 'package:weather_app/common/helper.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/screen/home/api/home_api.dart';

class HomeController extends GetxController {
  int selectedTimeSlot = 0;

  WeatherModel weatherModel = WeatherModel();
  RxBool loader = false.obs;

  @override
  void onInit() {
    init();
    super.onInit();
  }

  Future<void> init() async {
    loader.value = true;
    await getCurrentLocation();
    await getWeatherModel();
  }

  void onFullReportTap() {}

  void onTimeSelect(int index) {
    selectedTimeSlot = index;
    update(['today_weather']);
  }

  Future<void> getWeatherModel() async {
    loader.value = true;
    WeatherModel? model = await HomeApi.getAllWeatherData();
    if (model == null) {
      getWeatherModel();
    } else {
      weatherModel = model;
      loader.value = false;
    }
  }
}
