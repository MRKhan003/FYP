import 'package:ai_resume_reach/database/firebase_auth_functions.dart';
import 'package:ai_resume_reach/screens/resume_maker_screen.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: Image.asset(
          'assets/appLogo.png',
          height: 50,
          width: 50,
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.surface,
        surfaceTintColor: Theme.of(context).colorScheme.surface,
      ),
      body: SingleChildScrollView(
        child: DoubleBackToCloseApp(
          snackBar: SnackBar(
            content: Text('Back again to leave app'),
          ),
          child: Column(
            children: [
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                  ),
                  onPressed: () {
                    FirebaseAuthFunctions().logout(context);
                  },
                  child: Text(
                    'Logout',
                    style: GoogleFonts.poppins(
                      color: Theme.of(context).colorScheme.onSecondary,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ResumeMakerScreen(),
                      ),
                    );
                  },
                  child: Text(
                    'Go to resume',
                    style: GoogleFonts.poppins(
                      color: Theme.of(context).colorScheme.onSecondary,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
