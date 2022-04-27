import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/screen/dashboard/dashboard_controller.dart';
import 'package:weather_app/screen/dashboard/widgets/bottom_bar.dart';
import 'package:weather_app/screen/forecast/forecast_screen.dart';
import 'package:weather_app/screen/history/history_screen.dart';
import 'package:weather_app/screen/home/home_screen.dart';
import 'package:weather_app/screen/map/map_screen.dart';
import 'package:weather_app/utils/color_res.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DashboardController controller = Get.put(DashboardController());
    return Scaffold(
      backgroundColor: ColorRes.bgColor2,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              ColorRes.bgColor1,
              ColorRes.bgColor2,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: GetBuilder<DashboardController>(
          id: 'bottom_bar',
          builder: (controller) {
            if (controller.currentTab == 0) {
              return const HomeScreen();
            } else if (controller.currentTab == 1) {
              return const ForecastScreen();
            } else if (controller.currentTab == 2) {
              return const HistoryScreen();
            } else {
              return const MapScreen();
            }
          },
        ),
      ),
      bottomNavigationBar: const BottomBar(),
    );
  }
}
