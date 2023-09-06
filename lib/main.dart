import 'package:flutter/material.dart';
import 'flutter_class_2/design_2.dart';
import 'flutter_class_3/bottom_navigation_bar.dart';
import 'animated_button.dart';
import 'flutter_class_4/image_create.dart';
import 'flutter_class_5_splash_screen/splash_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:application_1/tasbih_app/simple_tasbih_app.dart';

/*
void main(List<String> args) {
  runApp(const SplashMain());
}
*/


void main() async {
  await GetStorage.init();
  runApp(const TasbihApp());
}
