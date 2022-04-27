import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import 'package:weather_app/service/pref_service.dart';
import 'package:weather_app/utils/pref_keys.dart';

class MapController extends GetxController {
  String mapUrl = "";
  RxBool loader = false.obs;

  void init() {
    getMapUrl();
  }

  void getMapUrl() {
    mapUrl =
        'https://openweathermap.org/weathermap?basemap=map&cities=true&layer=temperature&lat='
        '${PrefService.getDouble(PrefKeys.latitude)}&lon=${PrefService.getDouble(PrefKeys.longitude)}&zoom=8';
  }

  void onLoadStart(InAppWebViewController controller, Uri? uri) {
    loader.value = true;
  }

  void onLoadStop(InAppWebViewController controller, Uri? uri) {
    loader.value = false;
  }

  void onWebViewCreated(InAppWebViewController controller) {
    loader.value = true;
  }
}
