
import 'dart:async';

import 'package:flutter/services.dart';

import 'enums.dart';

class ConnectivitySpeed {
  static const MethodChannel _channel =
      const MethodChannel('connectivity_speed');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  /// Checks the network subtype of the device.
  Future<ConnectionSubtype> getNetworkSubtype() {
    throw UnimplementedError('getNetworkSubtype() has not been implemented.');
  }
}
