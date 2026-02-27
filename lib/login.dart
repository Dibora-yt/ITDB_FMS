import 'package:flutter/material.dart';
import 'package:maintenance_itdb/home.dart';
import 'package:maintenance_itdb/signup.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Centered Login text
            Text(
              "Login",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
              Text(
              "Welcome",
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),
        
            TextField(
              
              controller: usernameController,
              decoration: InputDecoration(labelText: "Username",labelStyle: TextStyle(color: Colors.black),),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: "Password",labelStyle: TextStyle(color: Colors.black),
              ),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to Home Page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
              child: Text("Login",),
            ),
            TextButton(
              onPressed: () {
                // Navigate to Signup Page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignupPage()),
                );
              },
              child: Text("Don't have an account? Sign up",style: TextStyle(color: Colors.cyan),),
              
            ),
          ],
        ),
      ),
    );
  }
}




