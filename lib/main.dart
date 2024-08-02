import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uptodo/routes/app_pages.dart';

void main() {
  runApp(const UpToApp());
}

class UpToApp extends StatelessWidget {
  const UpToApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
      home: Scaffold(
        body: Center(
          child: Text("hello"),
        ),
      ),
    );
  }
}
