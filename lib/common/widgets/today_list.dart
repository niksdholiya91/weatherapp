import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/common/helper.dart';
import 'package:weather_app/common/text_styles.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/utils/color_res.dart';
import 'package:weather_app/utils/strings.dart';

class TodayList extends StatelessWidget {
  final String? subTitle;
  final WeatherModel weatherModel;
  final int selectedIndex;
  final Function(int index) onTap;

  const TodayList({
    Key? key,
    this.subTitle,
    required this.weatherModel,
    required this.selectedIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(Strings.today, style: header),
              subTitle == null
                  ? const SizedBox()
                  : Text(
                      subTitle!,
                      style: subHeader,
                    ),
            ],
          ),
        ),
        SizedBox(height: Get.height * 0.035),
        SizedBox(
          height: Get.height * 0.11,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount:
                weatherModel.hourly == null ? 0 : weatherModel.hourly!.length,
            padding: const EdgeInsets.only(right: 10.0),
            itemBuilder: (context, index) {
              Current model = weatherModel.hourly![index];
              if (isToday(model.dt!) == false) {
                return const SizedBox();
              }
              return Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: InkWell(
                  onTap: () => onTap(index),
                  child: Container(
                    height: Get.height * 0.11,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18, vertical: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: selectedIndex == index
                          ? ColorRes.themeColor
                          : ColorRes.darkBlue,
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          getImageFromWeather(model.weather!.first.main!),
                          height: 60,
                        ),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              getDateFormatFromMillS('hh: mm a', model.dt!),
                              style: customStyle.copyWith(
                                fontSize: 13,
                              ),
                            ),
                            const Spacer(),
                            Text(
                              "${kelToCel(model.temp!).toStringAsFixed(2)}°C",
                              style: customStyle.copyWith(
                                fontSize: 18.5,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
