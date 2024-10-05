import 'dart:io';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path_provider_android/path_provider_android.dart';
import 'package:path_provider_ios/path_provider_ios.dart';

class HiveConfig {
  static Future<void> initHiveDatabase() async {
    if (Platform.isAndroid) PathProviderAndroid.registerWith();
    if (Platform.isIOS) PathProviderIOS.registerWith();
    final Directory dir = await getApplicationDocumentsDirectory();
    await Hive.initFlutter(dir.path);
  }
}