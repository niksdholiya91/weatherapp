import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_shadow/simple_shadow.dart';
import 'package:weather_app/common/helper.dart';
import 'package:weather_app/common/text_styles.dart';
import 'package:weather_app/screen/home/home_controller.dart';
import 'package:weather_app/utils/color_res.dart';
import 'package:weather_app/utils/strings.dart';

class HomeCenterWeather extends StatelessWidget {
  const HomeCenterWeather({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find();
    return Column(
      children: [
        SizedBox(height: Get.height * 0.06),
        SimpleShadow(
          opacity: 0.35,
          color: ColorRes.themeColor,
          offset: const Offset(0, 5),
          sigma: 20,
          child: Image.asset(
            getImageFromWeather(controller.weatherModel.current == null
                ? ''
                : controller.weatherModel.current!.weather!.first.main ?? ''),
            height: Get.height * 0.33,
            fit: BoxFit.fitHeight,
          ),
        ),
        SizedBox(height: Get.height * 0.05),
        Row(
          children: [
            infoTab(
              Strings.temp,
              '${kelToCel(controller.weatherModel.current!.temp ?? 0).toStringAsFixed(2)}°',
            ),
            infoTab(
              Strings.wind,
              '${controller.weatherModel.current!.windSpeed}km/h',
            ),
            infoTab(
              Strings.humidity,
              '${controller.weatherModel.current!.humidity}%',
            ),
          ],
        ),
      ],
    );
  }

  Widget infoTab(String title, String value) {
    return Expanded(
      child: Column(
        children: [
          Text(title, style: subTitle),
          SizedBox(height: Get.height * 0.008),
          Text(value, style: text1),
        ],
      ),
    );
  }
}
