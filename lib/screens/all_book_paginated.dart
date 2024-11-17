


import 'package:alok/bottomBar/book.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
// import 'package:paginate_firestore/paginate_firestore.dart';

class AllBooks extends StatefulWidget {
  AllBooks({Key? key}) : super(key: key);

  @override
  State<AllBooks> createState() => _AllBooksState();
}

class _AllBooksState extends State<AllBooks> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      // body: all_books(),
    );
  }}
//   Widget all_books()=> PaginateFirestore(
//         shrinkWrap: true,
//         scrollDirection: Axis.vertical,
//         itemBuilderType: PaginateBuilderType.listView, //Change types accordingly
//         itemBuilder: (context, documentSnapshots, index) {
//             final data = documentSnapshots[index].data() as Map<String, dynamic>;
//             String img = data["Img"];
//             String name = data["Title"];
//             String id = data['Id'];
//             String pdf = data['pdf'];
//             bool featured = data["Featured"];
//             String description = data["Description"];
//             String listen = data["Listen"];
//             String read = data["Read"];
//             String publisher = data["publisher"];
//             String credits = data["credits"];
//             String aboutAuthor = data["Author"];
//             List bookmark = data["Bookmark"];

//             return 
//           bookCard(
//     context: context,
//     read: read,
//     id: id,
//     description: description,
//     aboutAuthor: aboutAuthor,
//     bookmark: bookmark,
//     credits: credits,
//     featured: featured,
//     img: img,
//     listen: listen,
//     name: name,
//     pdf: pdf,
//     publisher: publisher,
//   );
// },
//     query: FirebaseFirestore.instance.collection('Book').orderBy("number",descending: true),
//     itemsPerPage: 10,
//     isLive: true,
//   );
// }