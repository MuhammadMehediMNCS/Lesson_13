import 'package:application_1/flutter_class_5_splash_screen/page_home_5.dart';
import 'package:application_1/flutter_class_5_splash_screen/page_videos_5.dart';
import 'package:flutter/material.dart';

class MaterialBottom extends StatefulWidget {
  const MaterialBottom({super.key});

  @override
  State<MaterialBottom> createState() => _MaterialBottomState();
}

class _MaterialBottomState extends State<MaterialBottom> {
  int index = 0;

  final pages = [
    const HomePage5(),
    const VideoPage5()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          indicatorColor: Colors.blue.shade100,
          labelTextStyle: MaterialStateProperty.all(
            const TextStyle(fontSize: 14, fontWeight: FontWeight.w500)
          )
        ),
        child: NavigationBar(
          height: 60,
          backgroundColor: const Color(0xFFf1f5fb),
          selectedIndex: index,
          onDestinationSelected: (index) => setState(() => this.index = index),
          animationDuration: const Duration(seconds: 3),
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(Icons.ondemand_video_outlined),
              label: 'Play Video',
            ),
          ]
        ),
      ),
      body: pages[index],
    );
  }
}