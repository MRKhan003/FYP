import 'package:ai_resume_reach/firebase_options.dart';
import 'package:ai_resume_reach/screens/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.light,
          surface: Colors.white,
          onSurface: Color(
            0xff325372,
          ),
          primary: Color(
            0xff4C9ACC,
          ),
          onPrimary: Color(
            0xff325372,
          ),
          secondary: Color(
            0xff325372,
          ),
          onSecondary: Color(
            0xffE4E3E8,
          ),
          error: Colors.red,
          onError: Color(
            0xffE4E3E8,
          ),
          outline: Color(
            0xff325372,
          ),
        ),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.white,
          brightness: Brightness.dark,
          surface: Color(
            0xff262833,
          ),
          onSurface: Colors.white,
          onPrimary: Color(
            0xffE4E3E8,
          ),
          primary: Color(
            0xff325372,
          ),
          secondary: Color(
            0xff4ACFAC,
          ),
          onSecondary: Color(
            0xffE4E3E8,
          ),
          error: Colors.red,
          onError: Color(
            0xffE4E3E8,
          ),
          outline: Color(
            0xff325372,
          ),
        ),
      ),
      themeMode: ThemeMode.system,
      home: SplashScreen(),
    );
  }
}
