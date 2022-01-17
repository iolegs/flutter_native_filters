import 'dart:async';

import 'package:flutter/services.dart';

export 'src/ci_filter_factory.dart';

class NativeFilters {
  static const MethodChannel _channel = MethodChannel('native_filters');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
