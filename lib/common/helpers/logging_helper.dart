import 'dart:developer';
import 'package:flutter/foundation.dart';

void debugLog(String message, {String tag = "DEBUG"}) {
  if (kDebugMode) {
    log(message, name: tag);
  }
}