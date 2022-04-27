import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_shadow/simple_shadow.dart';
import 'package:weather_app/common/helper.dart';
import 'package:weather_app/common/text_styles.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/screen/history/history_controller.dart';
import 'package:weather_app/utils/color_res.dart';

class HistoryList extends StatelessWidget {
  const HistoryList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HistoryController controller = Get.find();
    return Expanded(
      child: GridView.builder(
        padding: EdgeInsets.fromLTRB(Get.width * 0.05, 20, Get.width * 0.05, 0),
        itemCount: controller.history.length,
        itemBuilder: (context, index) {
          final Current model = controller.history[index].current!;
          return GetBuilder<HistoryController>(
            id: 'history_list',
            builder: (controller) {
              return InkWell(
                onTap: () => controller.onTabChange(index),
                child: Container(
                  padding: EdgeInsets.symmetric(
                      vertical: Get.width * 0.05, horizontal: Get.width * 0.05),
                  decoration: BoxDecoration(
                    color: controller.selectedIndex == index
                        ? ColorRes.themeColor
                        : ColorRes.darkBlue,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: ColorRes.themeColor.withOpacity(0.09),
                        blurRadius: 20,
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${kelToCel(model.temp!).round()}°c",
                                style: customStyle.copyWith(fontSize: 22),
                              ),
                              SizedBox(height: Get.width * 0.02),
                              Text(
                                model.weather!.first.main!,
                                style: subTitle,
                              ),
                            ],
                          ),
                          const Spacer(),
                          SimpleShadow(
                            color: ColorRes.themeColor,
                            sigma: 7,
                            child: Image.asset(
                              getImageFromWeather(model.weather!.first.main!),
                              width: Get.width * 0.13,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Text(
                        getDateFormatFromMillS('EEEE', model.dt!),
                        style: header,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        getDateFormatFromMillS('MMM, dd', model.dt!),
                        style: customStyle.copyWith(fontSize: 15),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
        ),
      ),
    );
  }
}
