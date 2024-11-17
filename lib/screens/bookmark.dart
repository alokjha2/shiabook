


import 'package:alok/bottomBar/book.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:paginate_firestore/paginate_firestore.dart';

class bookMark extends StatefulWidget {
  bookMark({Key? key}) : super(key: key);

  @override
  State<bookMark> createState() => _bookMarkState();
}

class _bookMarkState extends State<bookMark> {
  
  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Books"),
      ),
      // body: paginatebookmarked(uid: user.uid),
    );
  }


      }



  // Widget paginatebookmarked({required uid})=>PaginateFirestore(
  //   shrinkWrap: true,
  //   scrollDirection: Axis.vertical,
  //   itemBuilderType: PaginateBuilderType.listView, //Change types accordingly
  //   itemBuilder: (context, documentSnapshots, index) {
  //     final data = documentSnapshots[index].data() as Map<String, dynamic>;
  //     String img = data["Img"];
  //     String name = data["Title"];
  //     String id = data['Id'];
  //     String pdf = data['pdf'];
  //     bool featured = data["Featured"];
  //     String description = data["Description"];
  //     String listen = data["Listen"];
  //     String read = data["Read"];
  //     String publisher = data["publisher"];
  //     String credits = data["credits"];
  //     String aboutAuthor = data["Author"];
  //     List bookmark = data["Bookmark"];

  //     return 
  //       bookCard(
  //         context: context,
  //         read: read,
  //         id: id,
  //         description: description,
  //         aboutAuthor: aboutAuthor,
  //         bookmark: bookmark,
  //         credits: credits,
  //         featured: featured,
  //         img: img,
  //         listen: listen,
  //         name: name,
  //         pdf: pdf,
  //         publisher: publisher,
  //       );
  //     },
  //         query: FirebaseFirestore.instance.collection('Book').where("Bookmark", arrayContains: uid),
  //         itemsPerPage: 10,
  //         isLive: true,
  //       );

      class bottom_Bookmark extends StatefulWidget {
        bottom_Bookmark({Key? key}) : super(key: key);
      
        @override
        State<bottom_Bookmark> createState() => _bottom_BookmarkState();
      }
      
      class _bottom_BookmarkState extends State<bottom_Bookmark> {
  final user = FirebaseAuth.instance.currentUser!;
        @override
        Widget build(BuildContext context) {
          return Scaffold(
            // body: paginatebookmarked(uid: user.uid),
          );
        }
      }