import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:stage_1/app.dart';
import 'package:stage_1/core/settings/settings_controller.dart';
import 'package:stage_1/core/settings/settings_service.dart';
import 'package:stage_1/shared/helper/restart_helper.dart';
import 'package:stage_1/shared/helper/shared_refs.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

void main() async {
  final settingsController = SettingsController(SettingsService());
  // Dòng này để init SharedPreferences ko báo lỗi
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefs.init();

  await _configureLocalTimeZone();

  await settingsController.loadSettings();

  runApp(RestartApp(null, MyApp(settingsController: settingsController)));
}

Future<void> _configureLocalTimeZone() async {
  if (kIsWeb || Platform.isLinux) {
    return;
  }
  tz.initializeTimeZones();
  final String? timeZoneName = await FlutterNativeTimezone.getLocalTimezone();
  tz.setLocalLocation(tz.getLocation(timeZoneName!));
}
