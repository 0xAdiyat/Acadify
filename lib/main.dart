import 'package:acadify/screens/home_screen.dart';
import 'package:acadify/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value:
          SystemUiOverlayStyle.dark, // Set the status bar icons' color to dark
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Acadify',
        theme: ThemeData(
          primaryColor: AppColors.colorPrimary,
          useMaterial3: true,
        ),
        home: HomeScreen(),
      ),
    );
  }
}
