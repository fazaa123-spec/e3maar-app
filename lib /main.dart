import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'e3maar App',
      home: Scaffold(
        appBar: AppBar(title: const Text('e3maar')),
        body: const Center(child: Text('التطبيق اشتغل')),
      ),
    );
  }
}
