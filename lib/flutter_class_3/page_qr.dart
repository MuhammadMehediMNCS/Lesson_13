import 'package:flutter/material.dart';

class QRPageDesign extends StatefulWidget {
  const QRPageDesign({super.key});

  @override
  State<QRPageDesign> createState() => _QRPageDesignState();
}

class _QRPageDesignState extends State<QRPageDesign> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR Page'),
      ),
      body: Center(
        child: Container(
          height: 250.0,
          width: 250.0,
          decoration: BoxDecoration(
            border: Border.all(width: 3),
          ),
          child: const Center(child: Icon(Icons.qr_code, size: 180.0,)),
        ),
      ),
    );
  }
}