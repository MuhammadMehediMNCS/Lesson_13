import 'package:application_1/flutter_class_3/page_fab.dart';
import 'package:application_1/flutter_class_3/page_home.dart';
import 'package:application_1/flutter_class_3/page_location.dart';
import 'package:application_1/flutter_class_3/page_qr.dart';
import 'package:application_1/flutter_class_3/page_search.dart';
import 'package:application_1/flutter_class_3/widget_tabbar_material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomNavigationBarDesign extends StatelessWidget {
  final String title = 'FAB Bottom Navigation Bar';

  const BottomNavigationBarDesign({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      theme: ThemeData(
        primarySwatch: Colors.pink
      ),
      home: NavDesign(title: title,),
    );
  }
}

class NavDesign extends StatefulWidget {
  final String title;

  const NavDesign({super.key, required this.title});

  @override
  State<NavDesign> createState() => _NavDesignState();
}

class _NavDesignState extends State<NavDesign> {
  int index = 0;

  final pages = <Widget>[
    const HomePageDesign(),
    const QRPageDesign(),
    const LocationPageDesign(),
    const SearchPageDesign()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: pages[index],
      bottomNavigationBar: TabBarMaterialWidget(
        index: index,
        onChangedTab: onChangedTab
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.games),
        onPressed: () {
          Navigator.push(context, CupertinoPageRoute(builder: (context) => const FABPageDeign()));
        }
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  void onChangedTab(int index) {
    setState(() {
      this.index = index;
    });
  }
}