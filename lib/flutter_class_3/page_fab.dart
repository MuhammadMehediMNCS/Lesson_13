import 'dart:math';

import 'package:flutter/material.dart';


class FABPageDeign extends StatefulWidget {
  const FABPageDeign({super.key});

  @override
  State<FABPageDeign> createState() => _FABPageDeignState();
}

class _FABPageDeignState extends State<FABPageDeign> {
  String result = '';
  int Selected = 0;
  int Score = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FAB Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              result,
              style:const TextStyle(fontSize: 35.0, color: Colors.pink),
            ),
            const SizedBox(height: 80.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FloatingActionButton(
                  child: const Text('0'),
                  onPressed: () {
                    setState(() {
                      Selected = 0;
                      randomNumberGenerate();
                    });
                  }
                ),
                FloatingActionButton(
                  child: const Text('1'),
                  onPressed: () {
                    setState(() {
                      Selected = 1;
                      randomNumberGenerate();
                    });
                  }
                ),
                FloatingActionButton(
                  child: const Text('2'),
                  onPressed: () {
                    setState(() {
                      Selected = 2;
                      randomNumberGenerate();
                    });
                  }
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  randomNumberGenerate() {
    int randomNumber = Random().nextInt(10);

    setState(() {
      result = randomNumber.toString();

      if(Selected.toString()==result) {
        Score++;
      }
    });
  }
}