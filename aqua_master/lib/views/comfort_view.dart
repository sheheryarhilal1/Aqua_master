import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DXUnitController2 extends GetxController {
  var temperature = 32.0.obs;
  var mode = "On".obs; // Default mode is "On"
  var setPoint = "Low".obs;

  void adjustTemp(int change) {
    double newTemperature = temperature.value + change;

    // Ensure the temperature stays between 0 and 40 degrees
    if (newTemperature >= 0 && newTemperature <= 40) {
      temperature.value = newTemperature;
    }
  }

  void toggleMode() {
    if (mode.value == "On") {
      mode.value = "Off";
    } else if (mode.value == "Off") {
      mode.value = "Auto";
    } else {
      mode.value = "On";
    }
  }

  void toggleSetPoint() {
    if (setPoint.value == "Low") {
      setPoint.value = "Medium";
    } else if (setPoint.value == "Medium") {
      setPoint.value = "High";
    } else {
      setPoint.value = "Low";
    }
  }
}

class DXUnitControl2 extends StatelessWidget {
  // Initialize GetX Controller
  final DXUnitController2 controller = Get.put(DXUnitController2());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Set the background image for the entire screen
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'assets/mobile.jpg'), // Path to your background image
            fit: BoxFit.cover, // Makes sure the image covers the entire screen
          ),
        ),
        child: Center(
          child: Container(
            padding: EdgeInsets.all(30),
            decoration: BoxDecoration(
              // Semi-transparent background
              borderRadius: BorderRadius.circular(20),
              boxShadow: [],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                // Replace the Icon with Image
                Image.asset(
                  'assets/clover.png', // Path to your image
                  width: 160,
                  height: 80,
                ),
                SizedBox(height: 10),

                // Title
                Text(
                  'Comfort',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF00D2FF),
                  ),
                ),
                SizedBox(height: 30),

                // Temperature control section
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(
                              8.0), // Adjust padding as needed
                          child: ElevatedButton(
                            onPressed: () => controller.adjustTemp(1),
                            style: ElevatedButton.styleFrom(
                              shape: CircleBorder(),
                              backgroundColor:
                                  Color(0xFFFF4B4B), // Solid Red color
                              padding: EdgeInsets.all(
                                  20), // Adjust padding inside button
                            ),
                            child: Text(
                              '+',
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal:
                                  16.0), // Space between buttons and text
                          child: Obx(() => Text(
                                '${controller.temperature.toStringAsFixed(0)}°C',
                                style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(
                              8.0), // Adjust padding as needed
                          child: ElevatedButton(
                            onPressed: () => controller.adjustTemp(-1),
                            style: ElevatedButton.styleFrom(
                              shape: CircleBorder(),
                              backgroundColor:
                                  Color(0xFF4CAF50), // Solid Green color
                              padding: EdgeInsets.all(
                                  20), // Adjust padding inside button
                            ),
                            child: Text(
                              '−',
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 50),

                // Mode and Set Point Options
                Column(
                  children: [
                    ElevatedButton(
                      onPressed: controller.toggleMode,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF2980B9), // Solid Blue color
                        padding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Obx(() => Text(
                            'Mode: ${controller.mode.value}',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          )),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: controller.toggleSetPoint,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF2980B9), // Solid Blue color
                        padding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Obx(() => Text(
                            'Set Point: ${controller.setPoint.value}',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          )),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
