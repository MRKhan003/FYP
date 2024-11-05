import 'package:ai_resume_reach/authentications/signin_screen.dart';
import 'package:ai_resume_reach/controllers/signup_controller.dart';
import 'package:ai_resume_reach/database/firebase_auth_functions.dart';
import 'package:ai_resume_reach/widgets/text_fields_widget.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});
  SignupController signupController = SignupController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
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
                'Create your account',
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
                        textController: signupController.emailController,
                        keyboardType: TextInputType.emailAddress,
                        hideText: false,
                        fieldIcon: Icons.email_outlined,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFieldsWidget(
                        fieldText: 'Name',
                        textController: signupController.nameController,
                        keyboardType: TextInputType.text,
                        hideText: false,
                        fieldIcon: Icons.person_2_outlined,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFieldsWidget(
                        fieldText: 'User Name',
                        textController: signupController.userNameController,
                        keyboardType: TextInputType.text,
                        hideText: false,
                        fieldIcon: Icons.person_2_outlined,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFieldsWidget(
                        fieldText: 'Password',
                        textController: signupController.passwordController,
                        keyboardType: TextInputType.visiblePassword,
                        hideText: true,
                        fieldIcon: Icons.visibility_off_outlined,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFieldsWidget(
                        fieldText: 'Confirm Password',
                        textController: signupController.confirmController,
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
                          if (signupController
                                  .emailController.text.isNotEmpty &&
                              signupController.nameController.text.isNotEmpty &&
                              signupController
                                  .userNameController.text.isNotEmpty &&
                              signupController
                                  .passwordController.text.isNotEmpty &&
                              signupController
                                  .confirmController.text.isNotEmpty &&
                              signupController.passwordController.text ==
                                  signupController.confirmController.text) {
                            FirebaseAuthFunctions().createAccount(
                              signupController.emailController.text,
                              signupController.passwordController.text,
                              signupController.userNameController.text,
                              signupController.nameController.text,
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
                          'Signup',
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
                    'Already have an account?',
                    style: GoogleFonts.poppins(),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SigninScreen(),
                      ),
                    ),
                    child: Text(
                      'Sign-in',
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
