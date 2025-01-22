import 'package:aqua_master/controller/controller.dart';
import 'package:aqua_master/views/boiler_view.dart';
import 'package:aqua_master/views/booster_view.dart';
import 'package:aqua_master/views/comfort_view.dart';
import 'package:aqua_master/views/custom_container.dart';
import 'package:aqua_master/views/fan_view.dart';
import 'package:aqua_master/views/makeup_view.dart';
import 'package:aqua_master/views/recirculation_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CoolerView extends StatelessWidget {
  final CoolerController controller = Get.put(CoolerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Aqua Master',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        color: Colors.lightBlueAccent.withOpacity(0.2),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Obx(
              () => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  // Row 1
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomContainer(
                        imagepath: "assets/fan.png",
                        title: "Cooler",
                        temperature: "22",
                        point: "16",
                        onTaptoggle: controller.toggleCoolerStatus1,
                        color: controller.isOn1.value,
                        gridTap: () {
                          Get.to(() => DXUnitControl3());
                        },
                        text: controller.isOn1.value,
                      ),
                      const SizedBox(width: 20),
                      CustomContainer(
                        imagepath: "assets/clover.png",
                        title: "Comfort",
                        temperature: "25",
                        point: "18",
                        onTaptoggle: controller.toggleCoolerStatus2,
                        color: controller.isOn2.value,
                        gridTap: () {
                          Get.to(() => DXUnitControl2());
                        },
                        text: controller.isOn2.value,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  // Row 2
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomContainer(
                        imagepath: "assets/fire.png",
                        title: "Boiler",
                        temperature: "30",
                        point: "20",
                        onTaptoggle: controller.toggleCoolerStatus3,
                        color: controller.isOn3.value,
                        gridTap: () {
                          Get.to(DXUnitControl());
                        },
                        text: controller.isOn3.value,
                      ),
                      const SizedBox(width: 20),
                      CustomContainer(
                        imagepath: "assets/pump.png",
                        title: "Booster",
                        temperature: "",
                        point: "",
                        onTaptoggle: controller.toggleCoolerStatus4,
                        color: controller.isOn4.value,
                        gridTap: () {
                          Get.to(DXUnitControl4());
                        },
                        text: controller.isOn4.value,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  // Row 3
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomContainer(
                        imagepath: "assets/pump.png",
                        title: "Makeup",
                        temperature: "",
                        point: "",
                        onTaptoggle: controller.toggleCoolerStatus5,
                        color: controller.isOn5.value,
                        gridTap: () {
                          Get.to(DXUnitControl5());
                        },
                        text: controller.isOn5.value,
                      ),
                      const SizedBox(width: 20),
                      CustomContainer(
                        imagepath: "assets/pump.png",
                        title: "Recirculation",
                        temperature: "",
                        point: "",
                        onTaptoggle: controller.toggleCoolerStatus6,
                        color: controller.isOn6.value,
                        gridTap: () {
                          Get.to(DXUnitControl6());
                        },
                        text: controller.isOn6.value,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
