import 'package:flutter/material.dart';

class SearchPageDesign extends StatefulWidget {
  const SearchPageDesign({super.key});

  @override
  State<SearchPageDesign> createState() => _SearchPageDesignState();
}

class _SearchPageDesignState extends State<SearchPageDesign> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: TextField(
            decoration: InputDecoration(
              labelText: 'Search Your Mind',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0)
              )
            ),
          )
        ),
      ),
    );
  }
}