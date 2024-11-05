import 'package:ai_resume_reach/data_handler/user_details.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FirebaseStorageFunctions {
  UserDetails currentUser = UserDetails();
  final FirebaseFirestore ffObject = FirebaseFirestore.instance;
  Future<bool> sendUserData(UserDetails details) async {
    try {
      await ffObject.collection('Users').doc(details.uid).set({
        'UserID': details.uid,
        'UserName': details.userName,
        'UserEmail': details.email,
        'Name': details.name,
      });

      return true;
    } catch (e) {
      Fluttertoast.showToast(
        msg: "$e",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        backgroundColor: Colors.white,
        textColor: Colors.red,
        fontSize: 16.0,
      );
      return false;
    }
  }

  Future<bool> sendResumeData(
    String name,
    String email,
    String phoneNumber,
    String portfolio,
    String intro,
    List<String> experienceInstitute,
    List<String> experienceTitle,
    List<String> experienceDate,
    List<String> experienceLocation,
    List<String> educationInstitute,
    List<String> educationLevel,
    List<String> educationDate,
    List<String> educationGrade,
    List<String> certificationsInstitute,
    List<String> certificationTitle,
    List<String> certificationsDate,
    List<String> certificationsCredentials,
  ) async {
    try {
      await ffObject
          .collection('Users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('Resume Data')
          .doc()
          .set(
        {
          'Name': name,
          'Email': email,
          'Phone Number': phoneNumber,
          'Portfolio': portfolio,
          'Intro': intro,
          'Experience_Institute': experienceInstitute,
          'Experience_Title': experienceTitle,
          'Experience_Date': experienceDate,
          'Experience_Location': experienceLocation,
          'Education_Institute': educationInstitute,
          'Education_Level': educationLevel,
          'Education_Date': educationDate,
          'Education_Grade': educationGrade,
          'Certifications_Institute': certificationsInstitute,
          'Certifications_Title': certificationTitle,
          'Certifications_Date': certificationsDate,
          'Certifications_Credentials': certificationsCredentials,
        },
        SetOptions(
          merge: true,
        ),
      );
      Fluttertoast.showToast(
        msg: "Resume Data Saved",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        backgroundColor: Colors.white,
        textColor: Colors.green,
        fontSize: 16.0,
      );
      return true;
    } catch (e) {
      Fluttertoast.showToast(
        msg: "$e",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        backgroundColor: Colors.white,
        textColor: Colors.red,
        fontSize: 16.0,
      );
      return false;
    }
  }
}
