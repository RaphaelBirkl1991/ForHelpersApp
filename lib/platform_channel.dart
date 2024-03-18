import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PlatformChannel {
  static const MethodChannel alarmChannel = MethodChannel('ALARM_CHANNEL');

  static Future<void> nativeSetAlarm() async {
    try {
      await alarmChannel.invokeMethod("setAlarm");
    } on PlatformException catch (e) {
      debugPrint("FAILED TO INVOKE NATIVE METHOD");
    }
  }
}
