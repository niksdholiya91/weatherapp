import 'package:get/get.dart';
import 'package:weather_app/screen/forecast/forecast_controller.dart';
import 'package:weather_app/screen/history/history_controller.dart';
import 'package:weather_app/screen/home/home_controller.dart';
import 'package:weather_app/screen/map/map_controller.dart';

class DashboardController extends GetxController {
  int currentTab = 0;
  final HomeController homeController = Get.put(HomeController());
  final ForecastController forecastController = Get.put(ForecastController());
  final HistoryController historyController = Get.put(HistoryController());
  final MapController mapController = Get.put(MapController());

  void onBottomBarChange(int index) {
    currentTab = index;
    if (index == 0) {
      homeController.init();
    } else if (index == 1) {
      forecastController.init();
    } else if (index == 2) {
      historyController.init();
    } else {
      mapController.init();
    }
    update(['bottom_bar']);
  }
}
