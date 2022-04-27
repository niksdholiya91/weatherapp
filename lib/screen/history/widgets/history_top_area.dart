import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/common/text_styles.dart';
import 'package:weather_app/screen/history/history_controller.dart';
import 'package:weather_app/utils/strings.dart';

class HistoryTopArea extends StatelessWidget {
  const HistoryTopArea({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HistoryController controller = Get.find();
    return Column(
      children: [
        SizedBox(height: Get.height * 0.03),
        Text(Strings.historicalWeather, style: title),
        SizedBox(height: Get.height * 0.04),
      ],
    );
  }
}
