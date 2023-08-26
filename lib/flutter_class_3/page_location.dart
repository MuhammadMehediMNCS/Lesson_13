import 'package:flutter/material.dart';

class LocationPageDesign extends StatefulWidget {
  const LocationPageDesign({super.key});

  @override
  State<LocationPageDesign> createState() => _LocationPageDesignState();
}

class _LocationPageDesignState extends State<LocationPageDesign> {

  List<String> MyList = List.generate(100, (index) => 'Item Number $index');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Location Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView.builder(
          itemCount: MyList.length,
          itemBuilder: (context, index) {
            return Card(
              color: Colors.pink.shade100,
              child: ListTile(
                leading: const Icon(Icons.person_2_rounded),
                title: Text(MyList[index]),
              ),
            );
          }
        )
      ),
    );
  }
}