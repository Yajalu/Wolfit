import 'package:flutter/material.dart';
import 'package:wolfit_aplication/pages/home_page.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WOLFIT',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch:Colors.red).copyWith( secondary: Colors.red[200]),
        scaffoldBackgroundColor: const Color(0x00000000),
      ),
      home: Scaffold(
          
          
          body:  HomePage()),
          
    );
  }
}

