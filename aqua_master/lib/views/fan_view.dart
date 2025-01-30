import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DXUnitController3 extends GetxController {
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

class DXUnitControl3 extends StatelessWidget {
  // Initialize GetX Controller
  final DXUnitController3 controller = Get.put(DXUnitController3());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Image.asset(
            'assets/mobile.jpg', // Your background image path
            fit: BoxFit.cover,
            height: double.infinity, // Make sure it fills the screen
            width: double.infinity,
          ),
          // Overlay Container with information
          Center(
            child: Container(
              padding: EdgeInsets.all(30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: [],
              ),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    // Image inside the container
                    Image.asset(
                      "assets/Cooling-PNG-Clipart.png", // Path to your image
                      width: 160,
                      height: 80, color: Colors.black,
                    ),
                    SizedBox(height: 10),

                    // Title
                    Text(
                      'Cooler',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF00D2FF),
                      ),
                    ),
                    SizedBox(height: 30),

                    // Temperature control section
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ElevatedButton(
                                onPressed: () => controller.adjustTemp(1),
                                style: ElevatedButton.styleFrom(
                                  shape: CircleBorder(),
                                  backgroundColor:
                                      Color(0xFFFF4B4B), // Solid Red color
                                  padding: EdgeInsets.all(20),
                                ),
                                child: Text(
                                  '+',
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
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
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton(
                              onPressed: () => controller.adjustTemp(-1),
                              style: ElevatedButton.styleFrom(
                                shape: CircleBorder(),
                                backgroundColor:
                                    Color(0xFF4CAF50), // Solid Green color
                                padding: EdgeInsets.all(20),
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
                    ),
                    SizedBox(height: 50),

                    // Mode and Set Point Options
                    Column(
                      children: [
                        ElevatedButton(
                          onPressed: controller.toggleMode,
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Color(0xFF2980B9), // Solid Blue color
                            padding: EdgeInsets.symmetric(
                                vertical: 15, horizontal: 20),
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
                            backgroundColor:
                                Color(0xFF2980B9), // Solid Blue color
                            padding: EdgeInsets.symmetric(
                                vertical: 15, horizontal: 20),
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
        ],
      ),
    );
  }
}
