import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const E3maarApp());
}

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
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFFF6B00)),
        textTheme: GoogleFonts.cairoTextTheme(),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFFF6B00),
          foregroundColor: Colors.white,
          elevation: 0,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFFF6B00),
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            padding: const EdgeInsets.symmetric(vertical: 16),
          ),
        ),
      ),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const ClientScreen(),
    const CraftsmanScreen(),
    const WalletScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        selectedItemColor: const Color(0xFFFF6B00),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'الرئيسية'),
          BottomNavigationBarItem(icon: Icon(Icons.build), label: 'الحرفي'),
          BottomNavigationBarItem(icon: Icon(Icons.account_balance_wallet), label: 'المحفظة'),
        ],
      ),
    );
  }
}

// شاشة العميل
class ClientScreen extends StatelessWidget {
  const ClientScreen({super.key});

  final List<Map<String, dynamic>> services = const [
    {'icon': Icons.plumbing, 'name': 'سباكة'},
    {'icon': Icons.electrical_services, 'name': 'كهرباء'},
    {'icon': Icons.carpenter, 'name': 'نجارة'},
    {'icon': Icons.construction, 'name': 'حدادة'},
    {'icon': Icons.format_paint, 'name': 'نقاشة'},
    {'icon': Icons.door_front_door, 'name': 'ابواب'},
    {'icon': Icons.format_shapes, 'name': 'بياض'},
    {'icon': Icons.grid_4x4, 'name': 'سيراميك'},
    {'icon': Icons.ac_unit, 'name': 'تكييف'},
    {'icon': Icons.power, 'name': 'مولدات'},
    {'icon': Icons.solar_power, 'name': 'طاقة'},
    {'icon': Icons.foundation, 'name': 'بناء'},
    {'icon': Icons.shield, 'name': 'عزل'},
    {'icon': Icons.videocam, 'name': 'كاميرات'},
    {'icon': Icons.cleaning_services, 'name': 'نظافة'},
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            color: const Color(0xFFFF6B00),
            child: Row(
              children: [
                const Icon(Icons.location_on, color: Colors.white),
                const SizedBox(width: 8),
                const Text('الخرطوم، الخرطوم', style: TextStyle(color: Colors.white, fontSize: 16)),
                const Spacer(),
                const Icon(Icons.notifications, color: Colors.white),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFFFF6B00),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('🛡️ ضمان إعمار المعتمد', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                Text('اطلب فني يصلك خلال 60 دقيقة ⚡', style: TextStyle(color: Colors.white)),
              ],
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
              itemCount: services.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(services[index]['icon'], size: 32, color: const Color(0xFFFF6B00)),
                      const SizedBox(height: 8),
                      Text(services[index]['name']),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// شاشة الحرفي
class CraftsmanScreen extends StatelessWidget {
  const CraftsmanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('طلبات الحرفيين القريبة', style: TextStyle(fontSize: 20)),
    );
  }
}

// شاشة المحفظة
class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('الرصيد المتاح', style: TextStyle(fontSize: 18)),
          const Text('162,000 ج.س', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Color(0xFF008000))),
          const SizedBox(height: 20),
          ElevatedButton(onPressed: () {}, child: const Text('طلب تحويل لبنكك')),
        ],
      ),
    );
  }
}
