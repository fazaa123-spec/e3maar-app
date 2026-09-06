import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(const E3maarApp());

class E3maarApp extends StatelessWidget {
  const E3maarApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'إعمار',
      debugShowCheckedModeBanner: false,
      locale: const Locale('ar'),
      supportedLocales: const [Locale('ar')],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      theme: ThemeData(
        primaryColor: const Color(0xFFFF6B00),
        scaffoldBackgroundColor: const Color(0xFFF5F5F5),
        textTheme: GoogleFonts.cairoTextTheme(),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFFF6B00),
          foregroundColor: Colors.white,
        ),
      ),
      home: const HomeScreen(), // <-- دا المهم
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('إعمار')),
      body: const Center(child: Text('مرحبا بك في تطبيق إعمار', style: TextStyle(fontSize: 22))),
    );
  }
}
