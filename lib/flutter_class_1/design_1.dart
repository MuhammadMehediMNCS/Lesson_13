import 'package:flutter/material.dart';

class Design_One extends StatelessWidget {
  const Design_One({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo
      ),
      home: const AppBarDesign(),
    );
  }
}

class AppBarDesign extends StatefulWidget {
  const AppBarDesign({super.key});

  @override
  State<AppBarDesign> createState() => _AppBarDesignState();
}

class _AppBarDesignState extends State<AppBarDesign> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu)
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search)
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert)
          ),
          const SizedBox(
            width: 20.0,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Padding(
          padding: const EdgeInsets.only(top: 150.0),
          child: Container(
            height: 150.0,
            width: 370.0,
            color: Colors.red,
            child: const Padding(
              padding: EdgeInsets.only(top: 35.0),
              child: Center(
                child: Text(
                  'A Red Container',
                  style: TextStyle(fontSize: 20.0, color: Colors.white),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}