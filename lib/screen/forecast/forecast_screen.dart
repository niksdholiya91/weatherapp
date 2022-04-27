import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/common/widgets/loaders.dart';
import 'package:weather_app/screen/forecast/forecast_controller.dart';
import 'package:weather_app/screen/forecast/widgets/forecast_list.dart';
import 'package:weather_app/screen/forecast/widgets/forecast_top_area.dart';

class ForecastScreen extends StatelessWidget {
  const ForecastScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ForecastController controller = Get.put(ForecastController());
    return Obx(() {
      if (controller.loader.isTrue) {
        return const SmallLoader();
      } else {
        return SafeArea(
          child: Column(
            children: [
              const ForecastTopArea(),
              const ForecastList(),
              SizedBox(height: Get.height * 0.02),
            ],
          ),
        );
      }
    });
  }
}
