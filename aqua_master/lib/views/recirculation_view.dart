import 'package:aqua_master/views/cooler_views.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DXUnitController6 extends GetxController {
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

class DXUnitControl6 extends StatelessWidget {
  // Initialize GetX Controller
  final DXUnitController6 controller = Get.put(DXUnitController6());

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
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/mobile.jpg'), // Path to your image
            fit: BoxFit.cover, // Ensure the image covers the entire screen
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              // You can add any widgets you need here
            ],
          ),
        ),
      ),
    );
  }
}
