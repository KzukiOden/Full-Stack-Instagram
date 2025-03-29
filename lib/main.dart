import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/pages/sign_up.dart';
import 'package:instagram_clone/utili/colors.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: "AIzaSyCA6Dx4BQAW7XDUNJxVb4BMNLEF0vZCwxM",
        authDomain: "instagram-6c24b.firebaseapp.com",
        projectId: "instagram-6c24b",
        storageBucket: "instagram-6c24b.firebasestorage.app",
        messagingSenderId: "623479456400",
        appId: "1:623479456400:web:bfc4e0a196c0bef7e40e15",
      ),
    );
  } else {
    await Firebase.initializeApp();
  }

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
      // home: ResponsiveScreen(
      //   phoneScreenLayout: PhoneScreen(),
      //   webScreenLayout: WebScreen(),
      // ),
      home: SignUp(),
    );
  }
}
