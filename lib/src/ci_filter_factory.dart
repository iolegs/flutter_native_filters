import 'package:flutter/services.dart';

class CIFilterFactory {
  static const MethodChannel _methodChannel = MethodChannel('CIFilterFactory');

  const CIFilterFactory();

  Future<List<String>> get availableFilters async {
    try {
      final availableFilters =
          await _methodChannel.invokeListMethod<String>('availableFilters');
      return availableFilters ?? [];
    } catch (error) {
      print(error);
    }
    return [];
  }
}
