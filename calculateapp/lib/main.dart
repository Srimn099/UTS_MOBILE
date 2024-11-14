import 'package:calculateapp/pages/calculator.dart';
import 'package:calculateapp/pages/calculatorbmi.dart';
import 'package:calculateapp/pages/dashboard.dart';
import 'package:calculateapp/pages/math_operation_page.dart';
import 'package:calculateapp/pages/profile.dart';
import 'package:calculateapp/pages/splash.dart';
import 'package:calculateapp/pages/konversisuhu.dart';
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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/', // Menentukan route awal
      routes: {
        '/': (context) => const SplashPages(), // Route untuk halaman splash
        '/dashboard': (context) =>
            const DashboardPage(), // Route untuk halaman utama
        '/calculator': (context) =>
            const CalculatorPage(), // Route untuk halaman utama
        '/calculatorbmi': (context) =>
            const CalculatorBmi(), // Route untuk halaman utama
        '/mathoperation': (context) =>
            const MathOperationPage(), // Halaman operasi matematika
        '/konversisuhu': (context) =>
            const KonversiSuhuPage(), // Halaman operasi matematika
        '/profile': (context) =>
            const ProfilePage(), // Route untuk halaman utama
      },
    );
  }
}
