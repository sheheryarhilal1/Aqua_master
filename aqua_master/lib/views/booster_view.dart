import 'package:aqua_master/views/cooler_views.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DXUnitController4 extends GetxController {
  var mode = "On".obs; // Default mode is "On"

  void toggleMode() {
    if (mode.value == "On") {
      mode.value = "Off";
    } else if (mode.value == "Off") {
      mode.value = "Auto";
    } else {
      mode.value = "On";
    }
  }
}

class DXUnitControl4 extends StatelessWidget {
  // Initialize GetX Controller
  final DXUnitController4 controller = Get.put(DXUnitController4());

  @override
  Widget build(BuildContext context) {
    // Trigger the popup dialog immediately when the screen is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: Colors.blueGrey[800],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          title: Text(
            'Change Mode',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Obx(() => Text(
                'Current Mode: ${controller.mode.value}',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              )),
          actions: [
            TextButton(
              onPressed: () {
                controller.toggleMode();
              },
              child: Text(
                'Next Mode',
                style: TextStyle(
                  color: Color(0xFF00D2FF),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            TextButton(
              onPressed: () => Get.off(() => CoolerView()),
              child: Text(
                'Close',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      );
    });

    return Scaffold(
      body: Stack(
        fit: StackFit.expand, // Ensure the image covers the whole screen
        children: [
          // Background image
          Image.asset(
            'assets/mobile.jpg', // Path to your image
            fit: BoxFit.cover, // Make sure the image covers the entire screen
          ),
          // Foreground content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                // Your widgets here, for example:
                Text(
                  'DX Unit Control',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: controller.toggleMode,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF2980B9), // Solid Blue color
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
