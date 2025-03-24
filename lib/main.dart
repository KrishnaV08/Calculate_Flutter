import 'package:calculator_application_1/calculator_screen.dart';
import 'package:calculator_application_1/conversion.dart';
import 'package:calculator_application_1/home.dart';
import 'package:calculator_application_1/scientific.dart';
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
      
      
      title: 'Calculator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const Homepage(),
      routes: {
        '' : (context) => const Homepage(),
        '/Home' : (context) => const Homepage(),
        '/Basic' : (context) => const CalculatorScreen(),
        '/Conversion' : (context) => const Conversion(),
        '/Scientific' : (context) => const Scientific(),
      },
    ); 
  }
}

