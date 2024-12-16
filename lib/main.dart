import 'package:flutter/material.dart';
import 'package:report_ui/view/dashboard/advanced_drawer_custom.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Report ui',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(255, 231, 231, 231),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xff133F86),
          primary: const Color(0xff133F86),
          onPrimary: const Color(0xffffffff),
        ),
        useMaterial3: true,
      ),
      home: const AdvancedDrawerCustom(),
    );
  }
}
