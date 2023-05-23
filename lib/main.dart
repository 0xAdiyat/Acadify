import 'package:acadify/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Acadify',
      theme: ThemeData(
        primaryColor: Color(0xff29274f),
        useMaterial3: true,
      ),
      home: HomeScreen(),
    );
  }
}
