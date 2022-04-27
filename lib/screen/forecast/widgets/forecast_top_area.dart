import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/common/text_styles.dart';
import 'package:weather_app/common/widgets/today_list.dart';
import 'package:weather_app/screen/forecast/forecast_controller.dart';
import 'package:weather_app/utils/strings.dart';

class ForecastTopArea extends StatelessWidget {
  const ForecastTopArea({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: Get.height * 0.03),
        Text(Strings.forecastReport, style: title),
        SizedBox(height: Get.height * 0.04),
        GetBuilder<ForecastController>(
          id: 'today_weather',
          builder: (controller) {
            return TodayList(
              weatherModel: controller.forecast,
              selectedIndex: controller.selectedTimeSlot,
              onTap: controller.onTimeSelect,
              subTitle: DateFormat('MMMM dd, yyyy').format(DateTime.now()),
            );
          },
        ),
      ],
    );
  }
}
