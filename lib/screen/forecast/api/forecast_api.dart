import 'package:http/http.dart' as http;
import 'package:weather_app/common/toast_msg.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/service/http_service.dart';
import 'package:weather_app/service/pref_service.dart';
import 'package:weather_app/utils/endpoints.dart';
import 'package:weather_app/utils/pref_keys.dart';

class ForecastApi {
  static Future<WeatherModel?> getForecastData() async {
    try {
      String url = EndPoints.oneCall +
          EndPoints.lat +
          PrefService.getDouble(PrefKeys.latitude).toString() +
          '&' +
          EndPoints.lon +
          PrefService.getDouble(PrefKeys.longitude).toString() +
          '&' +
          EndPoints.exclude +
          '' +
          '&' +
          EndPoints.appId +
          EndPoints.apiKey;

      http.Response? response = await HttpService.getApi(url: url);

      if (response != null && response.statusCode == 200) {
        return weatherModelFromJson(response.body);
      }
      return null;
    } catch (e) {
      showToast(e.toString());
      return null;
    }
  }
}
