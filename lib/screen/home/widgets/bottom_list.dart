import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/common/widgets/today_list.dart';
import 'package:weather_app/screen/home/home_controller.dart';

class BottomList extends StatelessWidget {
  const BottomList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: Get.height * 0.04),
        GetBuilder<HomeController>(
          id: 'today_weather',
          builder: (controller) {
            return TodayList(
              weatherModel: controller.weatherModel,
              selectedIndex: controller.selectedTimeSlot,
              onTap: controller.onTimeSelect,
            );
          },
        ),
      ],
    );
  }
}
