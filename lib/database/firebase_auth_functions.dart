import 'package:ai_resume_reach/authentications/signin_screen.dart';
import 'package:ai_resume_reach/data_handler/user_details.dart';
import 'package:ai_resume_reach/database/firebase_storage_functions.dart';
import 'package:ai_resume_reach/screens/home_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FirebaseAuthFunctions with ChangeNotifier {
  FirebaseAuth auth = FirebaseAuth.instance;
  UserDetails currentUser = UserDetails();

  late bool exception;
  List<String> userNames = [];
  Future<bool> isDisplayNameTaken(String? userName) async {
    final nameResult = await FirebaseFirestore.instance
        .collection('Users')
        .where('UserName', isEqualTo: userName)
        .get();
    return nameResult.docs.isNotEmpty;
  }

  Future<bool> createAccount(String email, String pass, String userName,
      String name, BuildContext context) async {
    bool isTakenName;
    UserDetails userDetails = UserDetails();

    isTakenName = await isDisplayNameTaken(userName);
    if (isTakenName) {
      Fluttertoast.showToast(
        msg: 'User name already in use',
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        backgroundColor: const Color(0xffF8F8F8),
        textColor: Colors.red,
        fontSize: 16.0,
      );
      return false;
    } else {
      try {
        // getUserNames(userName);

        UserCredential credential = await auth.createUserWithEmailAndPassword(
            email: email, password: pass);
        if (credential.user != null) {
          userDetails.uid = credential.user!.uid;
          userDetails.userName = userName;
          userDetails.email = credential.user!.email;

          userDetails.name = name;
        }
        Fluttertoast.showToast(
          msg: "Account Created Successfully",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 3,
          backgroundColor: const Color(0xffF8F8F8),
          textColor: Colors.green,
          fontSize: 16.0,
        );
        FirebaseStorageFunctions().sendUserData(userDetails);
        navigateToNextScreenAfterSignUp(context);

        return true;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'invalid-email') {
          Fluttertoast.showToast(
              msg: e.code,
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 3,
              backgroundColor: const Color(0xffF8F8F8),
              textColor: Colors.red,
              fontSize: 16.0);
          return false;
        } else if (e.code == 'weak-password') {
          Fluttertoast.showToast(
              msg: 'Use a strong password',
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 3,
              backgroundColor: const Color(0xffF8F8F8),
              textColor: Colors.red,
              fontSize: 16.0);
          return false;
        } else if (e.code == 'email-already-in-use') {
          Fluttertoast.showToast(
              msg: 'Email already in use',
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 5,
              backgroundColor: const Color(0xffF8F8F8),
              textColor: Colors.red,
              fontSize: 16.0);
          return false;
        } else if (e.code == 'network-request-failed') {
          Fluttertoast.showToast(
              msg: 'Internet Connection Failed',
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 5,
              backgroundColor: const Color(0xffF8F8F8),
              textColor: Colors.red,
              fontSize: 16.0);
          return false;
        }
        return false;
      } catch (e) {
        Fluttertoast.showToast(
            msg: e.toString(),
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 5,
            backgroundColor: const Color(0xffF8F8F8),
            textColor: Colors.red,
            fontSize: 16.0);
        return false;
      }
    }
  }

  Future<bool> loggingIn(
      String email, String pass, BuildContext context) async {
    try {
      UserCredential loginCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: pass);

      if (loginCredential.user != null) {
        Fluttertoast.showToast(
          msg:
              "Welcome back ${await FirebaseFirestore.instance.collection('Users').doc(FirebaseAuth.instance.currentUser!.uid).get().then((DocumentSnapshot doc) {
            return doc['UserName'];
          })}",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 3,
          backgroundColor: const Color(0xffF8F8F8),
          textColor: Colors.green,
          fontSize: 16.0,
        );
        navigateToNextScreenAfterLogin(context);
      } else {}

      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-credential') {
        Fluttertoast.showToast(
            msg: 'Invalid email or password',
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 5,
            backgroundColor: const Color(0xffF8F8F8),
            textColor: Colors.red,
            fontSize: 16.0);
        return false;
      } else if (e.code == 'wrong-password') {
        Fluttertoast.showToast(
            msg: e.code,
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 5,
            backgroundColor: const Color(0xffF8F8F8),
            textColor: Colors.red,
            fontSize: 16.0);
        return false;
      } else if (e.code == 'invalid-email') {
        Fluttertoast.showToast(
            msg: 'The email address is badly formatted',
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 5,
            backgroundColor: const Color(0xffF8F8F8),
            textColor: Colors.red,
            fontSize: 16.0);
        return false;
      } else if (e.code == 'network-request-failed') {
        Fluttertoast.showToast(
            msg: 'Internet Connection Failed',
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 5,
            backgroundColor: const Color(0xffF8F8F8),
            textColor: Colors.red,
            fontSize: 16.0);
        return false;
      } else {
        Fluttertoast.showToast(
            msg: e.toString(),
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 5,
            backgroundColor: const Color(0xffF8F8F8),
            textColor: Colors.red,
            fontSize: 16.0);
      }
      return false;
    } catch (e) {
      Fluttertoast.showToast(
        msg: e.toString(),
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        backgroundColor: const Color(0xffF8F8F8),
        textColor: Colors.red,
        fontSize: 16.0,
      );
      return false;
    }
  }

  Future<bool> logout(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
      Fluttertoast.showToast(
        msg: 'Successfully signed out',
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        backgroundColor: const Color(0xffF8F8F8),
        textColor: Colors.green,
        fontSize: 16.0,
      );
      navigateToNextScreenAfterLogout(context);
      return true;
    } on FirebaseException catch (e) {
      Fluttertoast.showToast(
        msg: e.toString(),
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        backgroundColor: const Color(0xffF8F8F8),
        textColor: Colors.red,
        fontSize: 16.0,
      );
      return false;
    }
  }
}

void navigateToNextScreenAfterLogin(BuildContext context) {
  Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder: (context) => HomeScreen(),
    ),
    (Route<dynamic> route) => false,
  );
}

void navigateToNextScreenAfterSignUp(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => SigninScreen(),
    ),
  );
}

void navigateToNextScreenAfterLogout(BuildContext context) {
  Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder: (context) => SigninScreen(),
    ),
    (Route<dynamic> route) => false,
  );
}
