



import 'package:alok/bottomBar/book.dart';
import 'package:alok/content/bookPage.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

class book extends StatefulWidget {
  final String category;
  book({Key? key, required this.category}) : super(key: key);

  @override
  State<book> createState() => _bookState();
}

class _bookState extends State<book> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("${widget.category}")),
      body: body(widget.category),
    );
  }
Widget body(String category)=>

StreamBuilder(
  stream: FirebaseFirestore.instance.collection('Book').where("Category", arrayContainsAny: ["$category"]).limit(30).snapshots(),
  builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {

     if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        if (snapshot.data!.docs.length == 0) {
          return Center(
            child: Text('No Books in collection'),
          );
        }

        // Add your code to display the documents here

        return ListView(
        children: snapshot.data!.docs.map(
        (DocumentSnapshot document){
        Map<String, dynamic> data = document.data() as Map<String, dynamic>;
          String img = data["Img"];
            String name = data["Title"];
            String id = data['Id'];
            String pdf = data['pdf'];
            bool featured = data["Featured"];
            String description = data["Description"];
            String listen = data["Listen"];
            String read = data["Read"];
            String aboutAuthor = data["Author"];
            String publisher = data["publisher"];
            String credits = data["credits"];
            
            List bookmark = data["Bookmark"];
      return bookCard(
          context: context,
          read: read,
          id: id,
          description: description,
          aboutAuthor: aboutAuthor,
          bookmark: bookmark,
          credits: credits,
          featured: featured,
          img: img,
          listen: listen,
          name: name,
          pdf: pdf,
          publisher: publisher,
        );
      
        }
      )
  .toList()
  );
      
    }
    );
  }