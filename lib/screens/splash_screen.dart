import 'dart:async';

import 'package:ai_resume_reach/authentications/signup_screen.dart';
import 'package:ai_resume_reach/screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    navigateToScreen();
    super.initState();
  }

  void navigateToScreen() {
    if (FirebaseAuth.instance.currentUser == null) {
      Timer(
        Duration(seconds: 5),
        () => Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => SignupScreen(),
          ),
        ),
      );
    } else {
      Timer(
        Duration(seconds: 5),
        () => Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          children: [
            Spacer(),
            Center(
              child: Image.asset(
                'assets/appLogo.png',
                height: 200,
                width: 200,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Text(
                'Powered by The Solution Makers',
                style: GoogleFonts.poppins(
                  color: Theme.of(context).colorScheme.onSurface,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
