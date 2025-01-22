import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class CoolerController extends GetxController {
  RxBool isOn1 = false.obs;
  RxBool isOn2 = false.obs;
  RxBool isOn3 = false.obs;
  RxBool isOn4 = false.obs;
  RxBool isOn5 = false.obs;
  RxBool isOn6 = false.obs;

  void toggleCoolerStatus1() {
    isOn1.value = !isOn1.value;
  }

  void toggleCoolerStatus2() {
    isOn2.value = !isOn2.value;
  }

  void toggleCoolerStatus3() {
    isOn3.value = !isOn3.value;
  }

  void toggleCoolerStatus4() {
    isOn4.value = !isOn4.value;
  }

  void toggleCoolerStatus5() {
    isOn5.value = !isOn5.value;
  }

  void toggleCoolerStatus6() {
    isOn6.value = !isOn6.value;
  }
}
