import 'package:bmi_app/home.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        //هنا وضعت الثيمات والسمات الخاصة بكل التطبيق
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.teal,
          canvasColor: Colors.black,
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
          textTheme: const TextTheme(
            displayLarge: TextStyle(
                fontSize: 45, fontWeight: FontWeight.w800, color: Colors.white),
            displayMedium: TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),
            bodyMedium: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
        home: const MyHomePage());
  }
}
