import 'package:firebase_auth/firebase_auth.dart';
//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_sign_up/page/forgot.dart';
import 'package:google_sign_up/page/signup_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email.text,
      password: password.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login Page')),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                TextField(
                  controller: email,
                  decoration: InputDecoration(hintText: 'Email'),
                ),
                SizedBox(height: 25),
                TextField(
                  controller: password,
                  decoration: InputDecoration(hintText: 'Password'),
                ),
                ElevatedButton(onPressed: () => signIn(), child: Text('Login')),
                SizedBox(height: 25),
                ElevatedButton(
                  onPressed: () => Get.to(SignupPage()),
                  child: Text('Register Now'),
                ),
                SizedBox(height: 25),
                ElevatedButton(
                  onPressed: () => Get.to(Forgot()),
                  child: Text('Forgot Password'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
