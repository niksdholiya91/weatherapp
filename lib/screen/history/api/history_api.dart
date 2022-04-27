import 'package:http/http.dart' as http;
import 'package:weather_app/common/toast_msg.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/service/http_service.dart';
import 'package:weather_app/service/pref_service.dart';
import 'package:weather_app/utils/endpoints.dart';
import 'package:weather_app/utils/pref_keys.dart';

class HistoryApi {
  static Future<List<WeatherModel>> getPast5DayHistory() async {
    List<WeatherModel> modelList = [];
    DateTime now = DateTime.now();
    List<DateTime> weekList = List.generate(
      5,
      (index) => DateTime(now.year, now.month, now.day, 12)
          .add(Duration(days: (index + 1) * -1)),
    );
    try {
      for (var day in weekList) {
        String url = EndPoints.timeMachine +
            EndPoints.lat +
            PrefService.getDouble(PrefKeys.latitude).toString() +
            '&' +
            EndPoints.lon +
            PrefService.getDouble(PrefKeys.longitude).toString() +
            '&' +
            EndPoints.dt +
            "${(day.millisecondsSinceEpoch / 1000).round()}" +
            '&' +
            EndPoints.appId +
            EndPoints.apiKey;

        http.Response? response = await HttpService.getApi(url: url);

        if (response != null && response.statusCode == 200) {
          modelList.add(weatherModelFromJson(response.body));
        }
      }
      return modelList;
    } catch (e) {
      showToast(e.toString());
      return [];
    }
  }
}
