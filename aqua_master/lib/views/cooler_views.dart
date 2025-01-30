import 'package:aqua_master/views/boiler_view.dart';
import 'package:aqua_master/views/booster_view.dart';
import 'package:aqua_master/views/comfort_view.dart';
import 'package:aqua_master/views/fan_view.dart';
import 'package:aqua_master/views/makeup_view.dart';
import 'package:aqua_master/views/recirculation_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:aqua_master/controller/controller.dart';
import 'package:aqua_master/views/custom_container.dart';

class CoolerView extends StatelessWidget {
  final CoolerController controller = Get.put(CoolerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit
            .expand, // Ensures the background image covers the entire screen
        children: [
          // Background Image
          Image.asset(
            'assets/mobile.jpg', // Path to your background image
            fit: BoxFit.cover, // Ensures the image covers the screen
          ),
          // Content on top of the background image
          Container(
            color: Colors.black.withOpacity(
                0.3), // Semi-transparent overlay to make content visible
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Obx(
                  () => Column(
                    mainAxisAlignment: MainAxisAlignment
                        .center, // Centers the column vertically
                    crossAxisAlignment: CrossAxisAlignment
                        .center, // Centers the column horizontally
                    children: [
                      const SizedBox(height: 20),
                      // Centered Title Text
                      const Text(
                        'Aqua Master ',
                        style: TextStyle(
                          fontSize: 28,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      // Row 1
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomContainer(
                            imagepath: "assets/Cooling-PNG-Clipart.png",
                            title: "Cooler",
                            temperature: "25",
                            onTaptoggle: controller.toggleCoolerStatus1,
                            color: controller.isOn1.value,
                            gridTap: () {
                              Get.to(() =>
                                  DXUnitControl3()); // This will navigate to NextScreen
                            },
                            text: controller.isOn1.value,
                          ),
                          const SizedBox(width: 20),
                          CustomContainer(
                            imagepath: "assets/clover.png",
                            title: "Comfort",
                            temperature: "25",
                            onTaptoggle: controller.toggleCoolerStatus2,
                            color: controller.isOn2.value,
                            gridTap: () {
                              Get.to(
                                  DXUnitControl2()); // This will navigate to NextScreen
                            },
                            text: controller.isOn2.value,
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      // Row 2
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomContainer(
                            imagepath: "assets/fire.png",
                            title: "Boiler",
                            temperature: "30",
                            onTaptoggle: controller.toggleCoolerStatus3,
                            color: controller.isOn3.value,
                            gridTap: () {
                              Get.to(() =>
                                  DXUnitControl()); // This will navigate to NextScreen
                            },
                            text: controller.isOn3.value,
                          ),
                          const SizedBox(width: 20),
                          CustomContainer(
                            imagepath: "assets/pump.png",
                            title: "Booster",
                            temperature: "",
                            onTaptoggle: controller.toggleCoolerStatus4,
                            color: controller.isOn4.value,
                            gridTap: () {
                              Get.to(() =>
                                  DXUnitControl4()); // This will navigate to NextScreen
                            },
                            text: controller.isOn4.value,
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      // Row 3
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomContainer(
                            imagepath: "assets/pump.png",
                            title: "Makeup",
                            temperature: "",
                            onTaptoggle: controller.toggleCoolerStatus5,
                            color: controller.isOn5.value,
                            gridTap: () {
                              Get.to(() =>
                                  DXUnitControl5()); // This will navigate to NextScreen
                            },
                            text: controller.isOn5.value,
                          ),
                          const SizedBox(width: 20),
                          CustomContainer(
                            imagepath: "assets/pump.png",
                            title: "Recirculation",
                            temperature: "",
                            onTaptoggle: controller.toggleCoolerStatus6,
                            color: controller.isOn6.value,
                            gridTap: () {
                              Get.to(() =>
                                  DXUnitControl6()); // This will navigate to NextScreen
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
        ],
      ),
    );
  }
}
