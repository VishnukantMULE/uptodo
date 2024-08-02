import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const UpToApp());
}

class UpToApp extends StatelessWidget {
  const UpToApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Text("hello"),
        ),
      ),
    );
  }
}
