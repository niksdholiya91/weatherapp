import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/common/text_styles.dart';
import 'package:weather_app/service/pref_service.dart';
import 'package:weather_app/utils/pref_keys.dart';

class HomeTopArea extends StatelessWidget {
  const HomeTopArea({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: Get.height * 0.03),
        Text(PrefService.getString(PrefKeys.locality), style: title),
        SizedBox(height: Get.height * 0.02),
        Text(
          DateFormat('MMMM dd, yyyy').format(DateTime.now()),
          style: subHeader,
        ),
      ],
    );
  }
}
