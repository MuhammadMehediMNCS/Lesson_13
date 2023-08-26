import 'package:flutter/material.dart';

class HomePageDesign extends StatefulWidget {
  const HomePageDesign({super.key});

  @override
  State<HomePageDesign> createState() => _HomePageDesignState();
}

class _HomePageDesignState extends State<HomePageDesign> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Center(
            child: Wrap(
              direction: Axis.vertical,
              spacing: 16,
              children: [
                Container(
                  height: 250.0,
                  width: 300.0,
                  color: Colors.green,
                ),
                Container(
                  height: 250.0,
                  width: 300.0,
                  color: Colors.pink,
                ),
                Container(
                  height: 250.0,
                  width: 300.0,
                  color: Colors.blue,
                ),
                Container(
                  height: 250.0,
                  width: 300.0,
                  color: Colors.red,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}