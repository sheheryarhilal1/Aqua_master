import 'package:get/get.dart';

class MyController extends GetxController {
  String temperature = '0'; // Mutable state for temperature
  int value = 0; // Value for increase/decrease feature
  int selectedButton =
      0; // To keep track of selected button (0 = High, 1 = Medium, 2 = Auto)

  void onButtonSelect(int index) {
    selectedButton = index;
    update(); // Update the UI when the button is selected
  }

  void increaseValue() {
    value++;
    temperature = (int.parse(temperature) + 1)
        .toString(); // Increase temperature when value changes
    update(); // Update the UI when the value changes
  }

  void decreaseValue() {
    if (value > 0) {
      value--;
      temperature = (int.parse(temperature) - 1)
          .toString(); // Decrease temperature when value changes
      update(); // Update the UI when the value changes
    }
  }
}
