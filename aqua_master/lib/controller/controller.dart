import 'package:get/get.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';

class CoolerController extends GetxController {
  // MQTT Client setup
  late MqttServerClient client;
  final String broker = 'test.mosquitto.org';
  final String topic = 'cooler/status';

  // Independent states for each toggle
  var isOn1 = false.obs;
  var isOn2 = false.obs;
  var isOn3 = false.obs;
  var isOn4 = false.obs;
  var isOn5 = false.obs;
  var isOn6 = false.obs;

  @override
  void onInit() {
    super.onInit();
    // Initialize the MQTT client
    _initializeMQTT();
  }

  void _initializeMQTT() async {
    client = MqttServerClient(broker, '');
    client.port = 1883; // Use the appropriate port if different
    client.keepAlivePeriod = 30;
    client.onDisconnected = onDisconnected;
    client.onConnected = onConnected;

    final connMessage = MqttConnectMessage()
        .withClientIdentifier('AquaMasterClient')
        .withWillTopic('will/topic')
        .startClean()
        .withWillMessage('offline');
    client.connectionMessage = connMessage;

    try {
      await client.connect();
      if (client.connectionStatus!.state == MqttConnectionState.connected) {
        print('MQTT Client connected');
        _subscribeToTopic();
      } else {
        print('MQTT connection failed: ${client.connectionStatus}');
      }
    } catch (e) {
      print('MQTT connection failed: $e');
    }
  }

  void onDisconnected() {
    print('Disconnected from MQTT Broker');
  }

  void onConnected() {
    print('Connected to MQTT Broker');
  }

  void _subscribeToTopic() {
    client.subscribe(topic, MqttQos.atMostOnce);
    client.updates!.listen((List<MqttReceivedMessage<MqttMessage>> c) {
      final MqttPublishMessage message = c[0].payload as MqttPublishMessage;
      final payload =
          MqttPublishPayload.bytesToStringAsString(message.payload.message);

      // Handle message to update individual toggle states
      if (payload == 'on') {
        // Example: Update the first toggle
        isOn1.value = true;
      } else if (payload == 'off') {
        // Example: Update the first toggle
        isOn1.value = false;
      }
    });
  }

  // Toggle functions for cooler statuses
  void toggleCoolerStatus1() {
    isOn1.toggle();
    _publishMessage(isOn1.value ? 'on' : 'off');
  }

  void toggleCoolerStatus2() {
    if (client.connectionStatus?.state != MqttConnectionState.connected) {
      _initializeMQTT();
    }
    isOn2.toggle();
    _publishMessage(isOn2.value ? 'on' : 'off');
  }

  void toggleCoolerStatus3() {
    if (client.connectionStatus?.state != MqttConnectionState.connected) {
      _initializeMQTT();
    }
    isOn3.toggle();
    _publishMessage(isOn3.value ? 'on' : 'off');
  }

  void toggleCoolerStatus4() {
    if (client.connectionStatus?.state != MqttConnectionState.connected) {
      _initializeMQTT();
    }
    isOn4.toggle();
    _publishMessage(isOn4.value ? 'on' : 'off');
  }

  void toggleCoolerStatus5() {
    if (client.connectionStatus?.state != MqttConnectionState.connected) {
      _initializeMQTT();
    }
    isOn5.toggle();
    _publishMessage(isOn5.value ? 'on' : 'off');
  }

  void toggleCoolerStatus6() {
    if (client.connectionStatus?.state != MqttConnectionState.connected) {
      _initializeMQTT();
    }
    isOn6.toggle();
    _publishMessage(isOn6.value ? 'on' : 'off');
  }

  // Similar toggle methods for isOn2, isOn3, etc.

  void _publishMessage(String status) {
    if (client.connectionStatus?.state != MqttConnectionState.connected) {
      print('MQTT not connected. Attempting to reconnect...');
      _initializeMQTT();
      return;
    }

    final builder = MqttClientPayloadBuilder();
    builder.addString(status);
    client.publishMessage(topic, MqttQos.atMostOnce, builder.payload!);
    print('Published: $status');
  }
}
