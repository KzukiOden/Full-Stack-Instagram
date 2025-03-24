import 'package:flutter/material.dart';
import 'package:instagram_clone/responsive/phone_screen.dart';
import 'package:instagram_clone/responsive/responsive_screen.dart';
import 'package:instagram_clone/responsive/web_screen.dart';
import 'package:instagram_clone/utili/colors.dart';

void main() async{
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Full Stack Instagram',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: mobileBackgroundColor,
      ),
      home: ResponsiveScreen(
        phoneScreenLayout: PhoneScreen(),
        webScreenLayout: WebScreen(),
      ),
    );
  }
}
