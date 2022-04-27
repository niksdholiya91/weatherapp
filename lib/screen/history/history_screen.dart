import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/common/widgets/loaders.dart';
import 'package:weather_app/screen/history/history_controller.dart';
import 'package:weather_app/screen/history/widgets/history_list.dart';
import 'package:weather_app/screen/history/widgets/history_top_area.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HistoryController controller = Get.put(HistoryController());
    return Obx(() {
      if (controller.loader.isTrue) {
        return const SmallLoader();
      } else {
        return SafeArea(
          child: Column(
            children: const [
              HistoryTopArea(),
              HistoryList(),
            ],
          ),
        );
      }
    });
  }
}
