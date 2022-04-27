import 'package:get/get.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/screen/history/api/history_api.dart';

class HistoryController extends GetxController {
  List<WeatherModel> history = [];
  RxBool loader = false.obs;
  int selectedIndex = 0;

  Future<void> init() async {
    await getLastWeekList();
  }

  Future<void> getLastWeekList() async {
    loader.value = true;
    history = await HistoryApi.getPast5DayHistory();
    loader.value = false;
  }

  void onTabChange(int index) {
    selectedIndex = index;
    update(['history_list']);
  }
}
