import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import 'package:weather_app/common/widgets/loaders.dart';
import 'package:weather_app/screen/map/map_controller.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MapController controller = Get.put(MapController());
    return Column(
      children: [
        Expanded(
          child: Stack(
            children: [
              InAppWebView(
                initialUrlRequest: URLRequest(
                  url: Uri.parse(controller.mapUrl),
                ),
                onLoadStart: controller.onLoadStart,
                onLoadStop: controller.onLoadStop,
                onWebViewCreated: controller.onWebViewCreated,
              ),
              Obx(() {
                if (controller.loader.isTrue) {
                  return const FullScreenLoader(enableBgColor: true);
                } else {
                  return const SizedBox();
                }
              }),
            ],
          ),
        ),
        SizedBox(height: Get.height * 0.02)
      ],
    );
  }
}
