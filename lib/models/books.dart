



import 'package:cloud_firestore/cloud_firestore.dart';

class Book {
  String Author;
  String publisher;
  String credits;
  String Img;
  String Listen;
  String Read;
  String Title;
  String Description;
  num number;
  String Id;
  String pdf;
  Timestamp createdOn;
  String time;
  List<dynamic> Category; // dynamic because it is array
  bool Featured;
  List<dynamic> Bookmark;
  List<dynamic> WishList;
  List<dynamic> searchBy;




  Book({
    required this.Author,
    required this.publisher,
    required this.credits,
    required this.Img,
    required this.Listen,
    required this.Read,
    required this.Title,
    required this.Description,
    required this.number,
    required this.Id,
    required this.pdf,
    required this.createdOn,
    required this.time,
    required this.Category,
    required this.Featured,
    required this.Bookmark,
    required this.WishList,
    required this.searchBy,
  });

  factory Book.fromFirestore(DocumentSnapshot doc) {
    Map? data = doc.data() as Map;
    return Book(
      time: data["time"],
      WishList: data["WishList"],


      Author: data["Author"],
      Category: 
      data["Category"],
      Description: data["Description"],
      Featured: data["Featured"],
      Img: data["Img"],
      Read: data["Read"],
      Listen: data["Listen"],
      Title: data["Title"],
      credits: data["credits"],
      publisher: data["publisher"],
      number: data["number"], 
      Bookmark: data["Bookmark"], 
      Id: data["Id"], 
      pdf: data["pdf"], 
      searchBy: data["searchBy"], createdOn: data["createdOn"],
    );
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> data = {
      "Title" : this.Title,
      "Author" : this.Author,
      "Category" : this.Category,
      "Description" : this.Description,
      "Featured" : this.Featured,
      "Read" : this.Read,
      "Listen" : this.Listen,
      "credits" : this.credits,
      "publisher" : this.publisher,
      "number" : this.number,
      "searchBy" : this.searchBy,
      "pdf": this.pdf,
      "Id": this.Id,
      "Bookmark": this.Bookmark,

    };
    return data;
  }
}
 