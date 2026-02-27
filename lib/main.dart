import 'package:flutter/material.dart';
import 'package:maintenance_itdb/home.dart';
import 'package:maintenance_itdb/landingpage.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blank Landing Page',
      home: LandingPage(),
    );
  }
}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
@override

  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
    );
  }
}
  class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

   @override
  Widget build(BuildContext context) {
     return MaterialApp(
      home: SignupPage(),
    );
  }
  }



