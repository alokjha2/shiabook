


import 'package:cloud_firestore/cloud_firestore.dart';

class banner {
  String Title;
  int num;
  String Subtitle;
  String Img;
  String Id;
  String time;
  banner({
    required this.Title,
    required this.num,
    required this.Subtitle,
    required this.Img,
    required this.Id,
    required this.time,
  });


  factory banner.fromFirestore(DocumentSnapshot doc) {
    Map? data = doc.data() as Map;
    return banner(
      num: data["num"],
      time: data["time"],
      Id: data["Id"],
      Img: data["Img"],
      Title: data["Title"],
      Subtitle: data["Subtitle"]

    );
  }


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "num" : num,
      "time" : time,
      "Img" : Img,
      'Title': Title,
      'Subtitle': Subtitle,
      "Id" : Id
    };
  }
}
