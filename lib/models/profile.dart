


import 'package:cloud_firestore/cloud_firestore.dart';

class UserData {
  final String city;
  final String email;
  final String name;
  final String phoneno;
  final String uid;
  UserData({
    required this.city,
    required this.email,
    required this.name,
    required this.phoneno,
    required this.uid,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'city': city,
      'uid': uid,
      'phoneno': phoneno
    };
  }
factory UserData.fromFirestore(DocumentSnapshot doc) {
    Map? data = doc.data() as Map;
    return UserData(
      city: doc["city"], 
      email: doc["email"], 
      name: doc["name"], 
      phoneno: doc["phone number"], 
      uid: doc["uid"]

      );
  }
}
  