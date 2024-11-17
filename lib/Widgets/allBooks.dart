



import 'package:alok/Widgets/bookBox.dart';
import 'package:alok/broilers_code/continueListening.dart';
import 'package:alok/books.dart';
import 'package:alok/content/bookPage.dart';
import 'package:alok/helpers/loadingIndicator.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
// import 'package:paginate_firestore/paginate_firestore.dart';





// Widget paginate(page)=>PaginateFirestore(
//     shrinkWrap: true,
//           scrollDirection: Axis.vertical,
//           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 4,
//                 crossAxisSpacing: 10.0,
//                 mainAxisSpacing: 10.0,
//                 childAspectRatio:.8,
//               ),
          
//           itemBuilderType:
//         PaginateBuilderType.gridView, //Change types accordingly
//           itemBuilder: (context, documentSnapshots, index) {
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
//               bookBox(img: img,name: name,id: id,pdf: pdf,featured: featured,description: description, listen: listen, read: read,aboutAuthor: aboutAuthor,bookmark: bookmark, context: context, publisher: publisher, credits: credits);
//           },
//           query: FirebaseFirestore.instance.collection('Book').orderBy("number",descending: true),
//           itemsPerPage: 4,
//           isLive: true,
//         );
