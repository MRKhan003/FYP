import 'package:cloud_firestore/cloud_firestore.dart';

class UserDetails {
  String? name, email, userName, uid, jobTitle, intro, number, portfolio;
  Timestamp? time;
  UserDetails({
    this.email,
    this.intro,
    this.number,
    this.portfolio,
    this.userName,
    this.uid,
    this.jobTitle,
    this.name,
    this.time,
  });
}
