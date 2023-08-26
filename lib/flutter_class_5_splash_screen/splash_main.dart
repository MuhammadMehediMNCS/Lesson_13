import 'dart:async';

import 'package:application_1/flutter_class_5_splash_screen/user_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashMain extends StatelessWidget {
  static const String title = 'First Part of App';

  const SplashMain({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        primaryColor: Colors.red
      ),
      home: const FullUiDesign(),
    );
  }
}

class FullUiDesign extends StatefulWidget {
  const FullUiDesign({super.key});

  @override
  State<FullUiDesign> createState() => _FullUiDesignState();
}

class _FullUiDesignState extends State<FullUiDesign> {

  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 7), () {
      Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context) => const UserInformation()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            SizedBox(
              width: 180.0,
              height: 180.0,
              child: CircularProgressIndicator(strokeWidth: 20, color: Colors.deepOrange,)
            )
          ],
        ),
      ),
    );
  }

  Widget loadingScreen() => Container(
    height: 280.0,
    width: 280.0,
    decoration: const BoxDecoration(
      shape: BoxShape.circle,
      color: Colors.indigo
    ),
    child: const CircularProgressIndicator(
      strokeWidth: 15,
      color: Colors.red,
    ),
  );
}