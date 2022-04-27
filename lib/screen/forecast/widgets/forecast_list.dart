import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/common/helper.dart';
import 'package:weather_app/common/text_styles.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/screen/forecast/forecast_controller.dart';
import 'package:weather_app/utils/color_res.dart';
import 'package:weather_app/utils/strings.dart';

class ForecastList extends StatelessWidget {
  const ForecastList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ForecastController controller = Get.find();
    return Expanded(
      child: Column(
        children: [
          SizedBox(height: Get.height * 0.05),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(Strings.nextForecast, style: header),
            ),
          ),
          SizedBox(height: Get.height * 0.03),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
              itemCount: controller.forecast.daily == null
                  ? 0
                  : controller.forecast.daily!.length,
              itemBuilder: (context, index) {
                final Daily model = controller.forecast.daily![index];
                return Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                  margin: const EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: ColorRes.darkBlue,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              getDateFormatFromMillS('EEEE', model.dt!),
                              style: text1,
                            ),
                            const SizedBox(height: 7),
                            Text(
                              getDateFormatFromMillS('MMM, dd', model.dt!),
                              style: subHeader,
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: Text(
                            "${kelToCel(model.temp!.day!).round()}°c",
                            style: large,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Image.asset(
                            getImageFromWeather(model.weather!.first.main!),
                            height: Get.height * 0.08,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
