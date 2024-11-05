import 'package:ai_resume_reach/authentications/signup_screen.dart';
import 'package:ai_resume_reach/controllers/signin_controller.dart';
import 'package:ai_resume_reach/database/firebase_auth_functions.dart';
import 'package:ai_resume_reach/widgets/text_fields_widget.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class SigninScreen extends StatelessWidget {
  SigninScreen({super.key});
  SigninController controller = SigninController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        surfaceTintColor: Theme.of(context).colorScheme.surface,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              'assets/appLogo.png',
              height: 90,
              width: 90,
            ),
            Container(
              child: Text(
                'Sign-in to your account',
                style: GoogleFonts.poppins(
                  color: Theme.of(context).colorScheme.onSurface,
                  fontWeight: FontWeight.bold,
                  fontSize: 21,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  child: Column(
                    children: [
                      TextFieldsWidget(
                        fieldText: 'Email',
                        textController: controller.emailController,
                        keyboardType: TextInputType.emailAddress,
                        hideText: false,
                        fieldIcon: Icons.email_outlined,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFieldsWidget(
                        fieldText: 'Password',
                        textController: controller.passwordController,
                        keyboardType: TextInputType.visiblePassword,
                        hideText: true,
                        fieldIcon: Icons.visibility_off_outlined,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Theme.of(context).colorScheme.primary,
                        ),
                        onPressed: () {
                          if (controller.emailController.text.isNotEmpty &&
                              controller.passwordController.text.isNotEmpty) {
                            FirebaseAuthFunctions().loggingIn(
                              controller.emailController.text,
                              controller.passwordController.text,
                              context,
                            );
                          } else {
                            Fluttertoast.showToast(
                              msg: "Recheck your information and try again",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 5,
                              backgroundColor: Colors.white,
                              textColor: Colors.red,
                              fontSize: 16.0,
                            );
                          }
                        },
                        child: Text(
                          'Signin',
                          style: GoogleFonts.poppins(
                            color: Theme.of(context).colorScheme.onPrimary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'New to the app?',
                    style: GoogleFonts.poppins(),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignupScreen(),
                      ),
                    ),
                    child: Text(
                      'Sign up',
                      style: GoogleFonts.poppins(
                        color: Theme.of(context).colorScheme.onSurface,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
